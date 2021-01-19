import 'package:flutter/material.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/controllers/app.controller.dart';
import 'package:hcslzapp/pages/about/about.dart';
import 'package:hcslzapp/pages/associated/associated.update.dart';
import 'package:hcslzapp/pages/boutique/boutique.list.dart';
import 'package:hcslzapp/pages/defect/defect.list.dart';
import 'package:hcslzapp/pages/digital.identity/digital.identity.dart';
import 'package:hcslzapp/pages/document/document.list.dart';
import 'package:hcslzapp/pages/dtc.code/dtc.code.access.dart';
import 'package:hcslzapp/pages/event/events.calendar.dart';
import 'package:hcslzapp/pages/financial/payment.list.dart';
import 'package:hcslzapp/pages/partnership/partnership.list.dart';
import 'package:hcslzapp/pages/ride/my.ride.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  BuildContext gContext;
  final String _user;
  List<String> _listScreens = [
    "Associados",
    "Financeiro",
    "Eventos",
    "Parcerias",
    "Boutique",
  ];

  Dashboard(this._user);

  @override
  Widget build(BuildContext context) {
    gContext = context;
    return Scaffold(
      drawer: drawr,
      body: Stack(
        children: <Widget>[dashBg, content],
      ),
    );
  }

  get drawr => Drawer(
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
                Navigator.pop(gContext);
              },
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                Text('Tema Escuro:'),
                Container(
                  child: Switch(
                    activeColor: Colors.orangeAccent,
                    value: AppController.instance.isDarkTheme,
                    onChanged: (value) {
                      AppController.instance.changeTheme();
                    },
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(gContext);
              },
            ),
          ],
        ),
      );

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
          'Ola, Adalberto',
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
        subtitle: Text(
          'AJ102030',
          style: TextStyle(color: Colors.white60),
        ),
        trailing: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30.0,
          backgroundImage: AssetImage('assets/imgs/eu.jpg'),
        ),
      );

  get bar => (this._user != 'admin' ? SizedBox() : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _FeatureItem(
            'Requisições de Acesso',
            Icons.send_to_mobile,
            onClick: () {
              //_showContactsList(context);
            },
          ),
          _FeatureItem(
            'Documentos',
            Icons.file_copy_outlined,
            onClick: () {
              //_showContactsList(context);
            },
          ),
        ],
      )
  );

  get grid => (this._user == 'admin' ? gridAdm : gridAssociated);

  get gridAssociated => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridView.count(
            //crossAxisSpacing: 10,
            //mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            children: <Widget>[
              GridButton(
                title: "Associado",
                image: "assets/imgs/user.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(
                        builder: (gContext) => AssociatedUpdate()),
                  );
                },
              ),
              GridButton(
                title: "Financeiro",
                image: "assets/imgs/financeiro.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(builder: (gContext) => PaymentList()),
                  );
                },
              ),
              GridButton(
                title: "Carteira Harley Club",
                image: "assets/imgs/carteirad.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(builder: (gContext) => DigitalIdentity()),
                  );
                },
              ),
              GridButton(
                title: "Parcerias",
                image: "assets/imgs/parcerias.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(builder: (gContext) => PartnershipList()),
                  );
                },
              ),
              GridButton(
                title: "Eventos",
                image: "assets/imgs/eventos.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(builder: (gContext) => EventCalendar()),
                  );
                },
              ),
/*
              GridButton(
                title: "Documentos",
                image: "assets/imgs/docs.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(builder: (gContext) => DocumentList()),
                  );
                },
              ),
*/
              GridButton(
                title: "Codigos DTC",
                image: "assets/imgs/codigosdtc.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(builder: (context) => DtcCodeAccess()),
                  );
                },
              ),
/*
              GridButton(
                title: "Oficina",
                image: "assets/imgs/oficina.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(builder: (gContext) => DefectList()),
                  );
                },
              ),
*/
              GridButton(
                title: "Boutique",
                image: "assets/imgs/boutique.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(builder: (gContext) => BoutiqueList()),
                  );
                },
              ),
/*
              GridButton(
                title: "Classificados",
                image: "assets/imgs/classificados.png",
                context: gContext,
                onClick: () {
*/
/*                            Navigator.push(
                              gContext,
                              MaterialPageRoute(
                                builder: (gContext) {
                                  return Classificados();
                                },
                              ),
                            );*/ /*

                },
              ),
*/
/*
              GridButton(
                title: "Meu Role",
                image: "assets/imgs/maps.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(builder: (gContext) => MyRide()),
                  );
                },
              ),
*/
              GridButton(
                title: "O Harley Club",
                image: "assets/imgs/logo.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(builder: (gContext) => About()),
                  );
                },
              ),
            ],
          ),
        ),
      );

  get gridAdm => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: ListView.builder(
            itemCount: _listScreens.length,
            itemBuilder: _listItem,
          ),
        ),
      );

  Widget _listItem(BuildContext context, int index) {
    return Card(
      color: Colors.deepOrange[100],
      shadowColor: Colors.black,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.asset(
              "assets/imgs/logo.png",
              fit: BoxFit.fitHeight,
              width: 100.0,
            ),
            title: Text(
              _listScreens[index],
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
                  _listScreens[index],
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
/*                Text(
                  'Population: 200}',
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),*/
              ],
            ),
            onTap: () {
              //_showSnackBar(context, _allCities[index]);
            },
          )
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
      color: Colors.white,
      elevation: 10,
      child: InkWell(
        onTap: () {
          onClick();
        },
        splashColor: Colors.orange,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
/*              borderRadius: BorderRadius.all(Radius.circular(100.0)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 50.0,
                  color: Colors.deepOrange,
                )
              ],*/
          ),
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

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick; //callback

  _FeatureItem(this.name, this.icon, {@required this.onClick});

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
            width: MediaQuery.of(context).size.width/2 - 15,
            //width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.orange,
                  size: 40.0,
                ),
                Text(name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
