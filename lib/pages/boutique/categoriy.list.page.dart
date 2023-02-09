import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import '../../common/labels.and.hints.dart';
import '../../components/button.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../components/my.text.form.field.dart';
import '../../controllers/category.list.controller.dart';
import '../../models/category.dart';

const String _title = 'Categorias';

class CategoryListPage extends StatefulWidget {
  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  final CategoryListController _controller = CategoryListController();

  @override
  void initState() {
    _controller.getFuture().then((value) {
      _controller.setButtonVisibilty();
    }).catchError((e) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        return Scaffold(
          appBar: MyAppBar(_title),
          bottomNavigationBar:
              _controller.isHidedButton ? null : MyBottomAppBar(),
          body: FutureBuilder<List<Category>>(
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
                      _controller.categories.clear();
                      _controller.categories.addAll(snapshot.data!);
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
      });

  _widgets() => Column(
        children: [
          SizedBox(height: 10),
          MyTextFormField(
            textEditingController: _controller.titleCtrl,
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
                      leading: CircleAvatar(
                        child: Icon(Icons.category),
                        backgroundColor: Colors.white,
                      ),
                      title: Text(
                        _controller.listFiltered[i].title!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
}
