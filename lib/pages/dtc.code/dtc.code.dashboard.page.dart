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

  get grid => Expanded(
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
}

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
} //GridButton
