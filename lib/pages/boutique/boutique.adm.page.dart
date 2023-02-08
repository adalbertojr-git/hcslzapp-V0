import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import '../../common/labels.and.hints.dart';
import '../../common/photo.image.provider.dart';
import '../../components/button.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../components/my.text.form.field.dart';
import '../../controllers/boutique.adm.controller.dart';
import '../../models/product.dart';

const String _title = 'Boutique Harley Club';
const String _pathNoImage = 'assets/imgs/noImage.png';

class BoutiqueAdmPage extends StatefulWidget {
  @override
  State<BoutiqueAdmPage> createState() => _BoutiqueAdmPageState();
}

class _BoutiqueAdmPageState extends State<BoutiqueAdmPage> {
  final BoutiqueAdmController _controller = BoutiqueAdmController();

  @override
  void initState() {
    addListener();
    super.initState();
  }

  addListener() {
    _controller.firebaseRepo.db
        .collection('products')
        .snapshots()
        .listen((event) {
      setState(() {
        _controller.getFuture().catchError((e) {});
        _controller.setButtonVisibilty();
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(_title),
        bottomNavigationBar:
            _controller.isHidedButton ? null : MyBottomAppBar(),
        body: FutureBuilder<List<Product>>(
          future: _controller.future,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Progress();
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return CenteredMessage(
                    title: ERROR,
                    message: snapshot.error.toString(),
                  );
                } else {
                  if ((snapshot.data?.length)! > 0) {
                    _controller.products.clear();
                    // _controller.categories.clear();
                    _controller.products.addAll(snapshot.data!);
                    // _controller.getCategories();
                    // return _widgets();
                  }

                  return _widgets();
                }
            } //switch (snapshot.connectionState)
            return CenteredMessage(
              title: ERROR,
              message: UNKNOWN,
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Observer(
          builder: (_) => _controller.isHidedButton
              ? SizedBox()
              : Button(
                  icon: Icons.add,
                  onClick: () {
                    //_add(context);
                  },
                ),
        ),
      );

  _widgets() => Column(
        children: [
          SizedBox(height: 10),
          MyTextFormField(
            textEditingController: _controller.nameCtrl,
            label: labelNameProduct,
            hint: hintNameProduct,
            icon: Icons.search,
            inputType: TextInputType.text,
            onChanged: _controller.setFilter,
          ),
          Observer(
            builder: (_) => Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: _controller.listFiltered.length,
                itemBuilder: (_, int i) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[300],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListTile(
                      leading: _photo(_controller.listFiltered[i]),
                      title: Text(
                        _controller.listFiltered[i].name!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle:
                          Text('R\$ ' + _controller.listFiltered[i].price!),
                      trailing: Wrap(
                        spacing: 10, // space between two icons
                        children: <Widget>[
                          GestureDetector(
                            child: Icon(
                              Icons.arrow_forward,
                            ),
                            onTap: () {
/*                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AssociatedUpdatePage(
                                ADMIN,
                                _controller.listFiltered[i],
                              ),
                            ),
                          );*/
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, int index) => const Divider(),
              ),
            ),
          ),
        ],
      );

  _photo(Product product) => Container(
        width: 60.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(130.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(130.0),
            image: _loadPhoto(product),
          ),
        ),
      );

  DecorationImage _loadPhoto(Product product) => DecorationImage(
      image: product.images![0] != ""
          ? NetworkImage(product.images![0])
          : PhotoImageProvider().getImageProvider(
              File(_pathNoImage),
            ) as ImageProvider,
      fit: BoxFit.fill);
}
