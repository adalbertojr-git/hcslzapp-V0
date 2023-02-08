import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/models/product.dart';
import '../../common/messages.dart';
import '../../components/centered.message.dart';
import '../../components/my.appbar.dart';
import '../../components/progress.dart';
import '../../controllers/boutique.associated.controller.dart';
import 'color.map.dart';
import 'details.page.dart';

const String _title = 'Boutique Harley Club';

class BoutiquePage extends StatefulWidget {
  @override
  State<BoutiquePage> createState() => _BoutiquePageState();
}

class _BoutiquePageState extends State<BoutiquePage> {
  final BoutiqueAssociatedController _controller = BoutiqueAssociatedController();
  final kTextColor = Color(0xFF535353);
  final kTextLightColor = Color(0xFFACACAC);

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
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(_title),
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
                    _controller.categories.clear();
                    _controller.products.addAll(snapshot.data!);
                    _controller.getCategories();
                    // return _widgets();
                  }
/*                  else
                    return CenteredMessage(
                      title: WARNING,
                      message: NOTEXIST,
                    );*/

                  return _widgets();
                }
            } //switch (snapshot.connectionState)
            return CenteredMessage(
              title: ERROR,
              message: UNKNOWN,
            );
          },
        ),
      );

  _widgets() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _loadCategories(),
          _loadProducts(),
        ],
      );

  _loadCategories() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
          height: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _controller.categories.length,
            itemBuilder: (context, index) => buildCategory(index),
          ),
        ),
      );

  Widget buildCategory(int index) => Observer(
        builder: (context) => GestureDetector(
          onTap: () {
            _controller.setSelectedIndex(index);
            _controller.setFilter(_controller.categories[index]);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _controller.categories[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _controller.selectedIndex == index
                        ? kTextColor
                        : kTextLightColor,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20 / 4), //top padding 5
                  height: 2,
                  width: 30,
                  color: _controller.selectedIndex == index
                      ? Colors.black
                      : Colors.transparent,
                )
              ],
            ),
          ),
        ),
      );

  _loadProducts() => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Observer(builder: (_) {
            return GridView.builder(
              itemCount: _controller.listFiltered.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: _controller.listFiltered[index],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      product: _controller.listFiltered[index],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      );
}

class ItemCard extends StatelessWidget {
  final Product product;
  final Function() onTap;

  ItemCard({
    required this.product,
    required this.onTap,
  });

  final kTextLightColor = Color(0xFFACACAC);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: getColor(product.color!),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset('assets/imgs/boutique.png'),
                // child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20 / 4),
            child: Text(
              product.name!,
            ),
          ),
          Text(
            "R\$ ${product.price}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kTextLightColor,
            ),
          )
        ],
      ),
    );
  }
}
