import 'package:flutter/material.dart';
import 'package:hcslzapp/pages/boutique/categoriy.list.page.dart';
import 'package:hcslzapp/pages/boutique/product.list.page.dart';
import '../../components/my.bottom.appbar.dart';

const List<String> _listAdmScreens = [
  "Categorias",
  "Produtos",
];

const List<String> _listAdmScreensDesc = [
  "Lista de categorias dos produtos",
  "Lista de produtos Harley Club",
];

const List<IconData> _listAdmIcons = [
  Icons.category,
  Icons.wallet_giftcard,
];

// ignore: must_be_immutable
class BoutiqueDashboardPage extends StatelessWidget {
  List<Widget> _listAdmWidgets = [
    CategoryListPage(),
    ProductListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomAppBar(),
      body: Stack(
        children: <Widget>[_dashBg(), _content(context)],
      ),
    );
  }

  _dashBg() => Column(
        children: <Widget>[
          Expanded(
            child: Container(color: Colors.deepOrange[300]),
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 1,
          ),
        ],
      );

  _content(BuildContext context) => Container(
        child: Column(
          children: <Widget>[
            _header(context),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            // _bar(context),
            _grid(),
          ],
        ),
      );

  _header(BuildContext context) => ListTile(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        contentPadding: EdgeInsets.only(left: 10, right: 10, top: 30),
        title: const Text(
          'Boutique',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
          textAlign: TextAlign.center,
        ),
        subtitle: const Text(
          'Produtos da marca Harley Club',
          style: TextStyle(color: Colors.white60),
          textAlign: TextAlign.center,
        ),
        trailing: CircleAvatar(
          backgroundColor: Colors.lightBlueAccent,
          radius: 30.0,
          backgroundImage: AssetImage('assets/imgs/boutique.png'),
        ),
      );

  _grid() => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: ListView.builder(
            itemCount: _listAdmScreens.length,
            itemBuilder: _listItem,
          ),
        ),
      );

  Widget _listItem(BuildContext context, int index) => Card(
        color: Colors.deepOrange[100],
        shadowColor: Colors.black,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                _listAdmIcons[index],
                size: 50,
                color: Colors.orange,
              ),
              title: Text(
                _listAdmScreens[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _listAdmScreensDesc[index],
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_gContext) => _listAdmWidgets[index]),
                );
              },
            )
          ],
        ),
      );
}
