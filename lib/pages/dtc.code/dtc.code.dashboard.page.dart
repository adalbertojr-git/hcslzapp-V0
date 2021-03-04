import 'package:flutter/material.dart';
import 'package:hcslzapp/pages/partnership/partnership.list.page.dart';

// ignore: must_be_immutable
class DtcCodeDashboardPage extends StatelessWidget {
  BuildContext _gContext;

  @override
  Widget build(BuildContext context) {
    _gContext = context;
    return Scaffold(
      body: Stack(
        children: <Widget>[dashBg, grid],
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

  get grid => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 100),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            children: <Widget>[
              _GridButton(
                  title: "Associado",
                  image: "assets/imgs/user.png",
                  context: _gContext,
                  onClick: () async {}),
              _GridButton(
                title: "Financeiro",
                image: "assets/imgs/financeiro.png",
                context: _gContext,
                onClick: () {},
              ),
              _GridButton(
                title: "Carteira Harley Club",
                image: "assets/imgs/carteirad.png",
                context: _gContext,
                onClick: () {},
              ),
              _GridButton(
                title: "Parcerias",
                image: "assets/imgs/parcerias.png",
                context: _gContext,
                onClick: () {
                  Navigator.push(
                    _gContext,
                    MaterialPageRoute(
                        builder: (gContext) => PartnershipListPage()),
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
