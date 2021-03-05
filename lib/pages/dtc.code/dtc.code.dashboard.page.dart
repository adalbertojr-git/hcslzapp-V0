import 'package:flutter/material.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/pages/dtc.code/dtc.code.access.page.dart';
import 'package:hcslzapp/pages/dtc.code/dtc.code.list.page.dart';
import 'package:hcslzapp/pages/partnership/partnership.list.page.dart';
import 'dart:io';

// ignore: must_be_immutable
class DtcCodeDashboardPage extends StatelessWidget {
  BuildContext _gContext;

  List<String> _listAdmScreens = [
    "Códigos",
    "Abreviaturas",
  ];

  List<String> _listAdmScreensDesc = [
    "Lista de códigos de erro catalogados pela HD",
    "Lista de siglas utilizadas",
  ];

  List<IconData> _listAdmIcons = [
    Icons.search,
    Icons.list_rounded,
  ];

  List<Widget> _listAdmWidgets = [
    DtcCodeAccessPage(),
    DtcCodeListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    _gContext = context;
    return Scaffold(
      body: Stack(
        children: <Widget>[dashBg, content],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Button(
        icon: Icons.arrow_back,
        onClick: () => Navigator.of(context).pop(),
      ),
    );
  }

  get dashBg => Column(
        children: <Widget>[
          Expanded(
            child: Container(color: Colors.deepOrange[300]),
            //flex: 3,
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 2,
          ),
        ],
      );

  get content => Container(
        child: Column(
          children: <Widget>[
            header,
            bar,
            grid,
          ],
        ),
      );

  get header => ListTile(
        contentPadding: EdgeInsets.only(left: 40, right: 20, top: 30),
        title: Text(
          'Códigos DTC',
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
        subtitle: Text(
          'Diagnostic Trouble Codes',
          style: TextStyle(color: Colors.white60),
        ),
        trailing: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30.0,
          backgroundImage: AssetImage('assets/imgs/codigosdtc.png'),
        ),
      );

  get bar => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _BarButton(
            'Modelos 2000-2004',
            'Forma de acesso',
            Icons.motorcycle_outlined,
            onClick: () {
              Navigator.push(
                _gContext,
                MaterialPageRoute(
                    builder: (_gContext) => DtcCodeListPage()),
              );
            },
          ),
          _BarButton(
            'Modelos > 2005',
            'Forma de acesso',
            Icons.motorcycle_sharp,
            onClick: () {
              //_showContactsList(context);
            },
          ),
        ],
      );

  get grid => Expanded(
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
                  fontSize: 14.0,
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
                      fontSize: 11.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  _gContext,
                  MaterialPageRoute(
                      builder: (_gContext) => _listAdmWidgets[index]),
                );
              },
            )
          ],
        ),
      );
}
/* get grid2 => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            children: <Widget>[
              _GridButton(
                  title: "Modelos 2000-2004",
                  image: "assets/imgs/user.png",
                  context: _gContext,
                  onClick: () {
                    Navigator.push(
                      _gContext,
                      MaterialPageRoute(
                          builder: (gContext) => DtcCodeAccessPage()),
                    );
                  }),
              _GridButton(
                title: "Modelos > 2005",
                image: "assets/imgs/financeiro.png",
                context: _gContext,
                onClick: () {
                  Navigator.push(
                    _gContext,
                    MaterialPageRoute(
                        builder: (gContext) => DtcCodeAccessPage()),
                  );
                },
              ),
              _GridButton(
                title: "Códigos",
                image: "assets/imgs/carteirad.png",
                context: _gContext,
                onClick: () {
                  Navigator.push(
                    _gContext,
                    MaterialPageRoute(builder: (gContext) => DtcCodeListPage()),
                  );
                },
              ),
              _GridButton(
                title: "Abreviaturas",
                image: "assets/imgs/parcerias.png",
                context: _gContext,
                onClick: () {
                  Navigator.push(
                    _gContext,
                    MaterialPageRoute(builder: (gContext) => DtcCodeListPage()),
                  );
                },
              ),
            ],
          ),
        ),
      );
}*/
/*
class _GridButton extends StatelessWidget {
  _GridButton({this.title, this.image, this.context, this.onClick});

  final String title;
  final String image;
  final BuildContext context;
  final Color color = Colors.white10;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      child: InkWell(
        onTap: () {
          onClick();
        },
        splashColor: Colors.black,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  } //build
} //GridButton*/

class _BarButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function onClick; //callback

  _BarButton(this.title, this.subtitle, this.icon, {@required this.onClick});

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
                  color: Colors.orange,
                  size: 50.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.0,
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
