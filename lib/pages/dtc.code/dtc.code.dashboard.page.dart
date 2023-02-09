import 'package:flutter/material.dart';
import 'package:hcslzapp/pages/dtc.code/dtc.code.access.oldmodels.page.dart';
import 'package:hcslzapp/pages/dtc.code/dtc.code.list.page.dart';
import '../../components/my.bottom.appbar.dart';
import 'dtc.code.abbreviation.list.page.dart';
import 'dtc.code.access.newmodels.page.dart';

const List<String> _listAdmScreens = [
  "Códigos",
  "Abreviaturas",
];

const List<String> _listAdmScreensDesc = [
  "Códigos de erro catalogados pela HD",
  "Siglas utilizadas",
];

const List<IconData> _listAdmIcons = [
  Icons.error_outline_rounded,
  Icons.abc_outlined,
];

// ignore: must_be_immutable
class DtcCodeDashboardPage extends StatelessWidget {
  List<Widget> _listAdmWidgets = [
    DtcCodeListPage(),
    DtcCodeAbbreviationListPage(),
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
            _bar(context),
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
          'Códigos DTC',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
          textAlign: TextAlign.center,
        ),
        subtitle: const Text(
          'Diagnostic Trouble Codes',
          style: TextStyle(color: Colors.white60),
          textAlign: TextAlign.center,
        ),
        trailing: CircleAvatar(
          backgroundColor: Colors.lightBlueAccent,
          radius: 30.0,
          backgroundImage: AssetImage('assets/imgs/codigosdtc.png'),
        ),
      );

  _bar(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _BarButton(
            'Até 2004',
            'Forma de acesso',
            Icons.motorcycle_outlined,
            Colors.orange,
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_gContext) => DtcCodeAccessOldModelsPage()),
              );
            },
          ),
          _BarButton(
            'A partir de 2005',
            'Forma de acesso',
            Icons.motorcycle_sharp,
            Colors.white,
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_gContext) => DtcCodeAccessNewModelsPage()),
              );
            },
          ),
        ],
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

class _BarButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Function onClick; //callback

  _BarButton(this.title, this.subtitle, this.icon, this.iconColor,
      {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: Colors.deepOrange[100],
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: EdgeInsets.all(8),
            height: 100,
            width: MediaQuery.of(context).size.width / 2 - 15,
            //width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: iconColor,
                  size: 50.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
