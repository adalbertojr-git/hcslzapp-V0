import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hcslzapp/pages/associated/associated.update.dart';
import 'package:hcslzapp/pages/boutique/boutique.list.dart';
import 'package:hcslzapp/pages/digital.identity/digital.identity.dart';
import 'package:hcslzapp/pages/dtc.code/dtc.code.access.dart';
import 'package:hcslzapp/pages/document/document.list.dart';
import 'package:hcslzapp/pages/event/events.calendar.dart';
import 'package:hcslzapp/pages/financial/payment.list.dart';
import 'package:hcslzapp/pages/defect/defect.list.dart';
import 'package:hcslzapp/pages/partnership/partnership.list.dart';
import 'package:hcslzapp/pages/ride/my.ride.dart';
import 'package:hcslzapp/pages/about/about.dart';

class Dashboard_Old extends StatelessWidget {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Text(
              'Ladies Harley Club',
              textAlign: TextAlign.center,
            ),
            UserAccountsDrawerHeader(
              accountName: Text(
                "Adalberto Jr.",
              ),
              accountEmail: Text("user@harleyclub.com"),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/imgs/ladies.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Sobre o HCSlz App"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: this._pinned,
            snap: this._snap,
            floating: this._floating,
            expandedHeight: 140.0,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Ola, Adalberto",
                style:
                    new TextStyle(fontSize: 20.0, color: Colors.orangeAccent),
              ),
              background: Image.asset(
                'assets/imgs/passeio.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),

          // If the main content is a list, use SliverList instead.
          SliverFillRemaining(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/imgs/hdlogo.png',
                    width: size.width,
                    height: size.height,
                  ),
                ),
                Center(
                  child: Container(
                    color: Colors.black12,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 20.0,
                      children: <Widget>[
                        GridButton(
                          title: "Associado",
                          image: "assets/imgs/user.png",
                          context: context,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AssociatedUpdate();
                                },
                              ),
                            );
                          },
                        ),
                        GridButton(
                          title: "Financeiro",
                          image: "assets/imgs/financeiro.png",
                          context: context,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PaymentList();
                                },
                              ),
                            );
                          },
                        ),
                        GridButton(
                          title: "Carteira Harley Club",
                          image: "assets/imgs/carteirad.png",
                          context: context,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DigitalIdentity();
                                },
                              ),
                            );
                          },
                        ),
                        GridButton(
                          title: "Parcerias",
                          image: "assets/imgs/parcerias.png",
                          context: context,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PartnershipList();
                                },
                              ),
                            );
                          },
                        ),
                        GridButton(
                          title: "Eventos",
                          image: "assets/imgs/eventos.png",
                          context: context,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EventCalendar();
                                },
                              ),
                            );
                          },
                        ),
                        GridButton(
                          title: "Documentos",
                          image: "assets/imgs/docs.png",
                          context: context,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DocumentList();
                                },
                              ),
                            );
                          },
                        ),
                        GridButton(
                          title: "Codigos DTC",
                          image: "assets/imgs/codigosdtc.png",
                          context: context,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DtcCodeAccess();
                                },
                              ),
                            );
                          },
                        ),
                        GridButton(
                          title: "Oficina",
                          image: "assets/imgs/oficina.png",
                          context: context,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DefectList();
                                },
                              ),
                            );
                          },
                        ),
                        GridButton(
                          title: "Boutique",
                          image: "assets/imgs/boutique.png",
                          context: context,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BoutiqueList();
                                },
                              ),
                            );
                          },
                        ),
                        GridButton(
                          title: "Classificados",
                          image: "assets/imgs/classificados.png",
                          context: context,
                          onClick: () {
/*                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Classificados();
                                },
                              ),
                            );*/
                          },
                        ),
                        GridButton(
                          title: "Meu Role",
                          image: "assets/imgs/maps.png",
                          context: context,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MyRide();
                                },
                              ),
                            );
                          },
                        ),
                        GridButton(
                          title: "O Harley Club",
                          image: "assets/imgs/logo.png",
                          context: context,
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return About();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GridButton extends StatelessWidget {
  GridButton({this.title, this.image, this.context, this.onClick});

  final String title;
  final String image;
  final BuildContext context;
  final Color color = Colors.white10;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: this.color,
      child: InkWell(
        onTap: () {
          onClick();
        },
        splashColor: Colors.orange,
        child: Container(
          decoration: BoxDecoration(
              color: this.color,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 50.0,
                  color: Colors.deepOrange,
                )
              ]),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  } //build
} //GridButton
