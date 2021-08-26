import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/controllers/app.controller.dart';
import 'package:hcslzapp/controllers/dashboard.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/pages/about/about.page.dart';
import 'package:hcslzapp/pages/access.request/access.request.list.page.dart';
import 'package:hcslzapp/pages/associated/associated.list.page.dart';
import 'package:hcslzapp/pages/associated/associated.update.page.dart';
import 'package:hcslzapp/pages/boutique/boutique.list.page.dart';
import 'package:hcslzapp/pages/digital.identity/digital.identity.page.dart';
import 'package:hcslzapp/pages/dtc.code/dtc.code.dashboard.page.dart';
import 'package:hcslzapp/pages/event/event.calendar.page.dart';
import 'package:hcslzapp/pages/payment/payment.list.page.dart';
import 'package:hcslzapp/pages/payment/payment.associated.page.dart';
import 'package:hcslzapp/pages/partnership/partnership.list.page.dart';
import 'dart:io';

import 'package:path/path.dart';

// ignore: must_be_immutable
class DashboardPage extends StatefulWidget {
  final String _user;
  Associated _associated;

  DashboardPage(this._user, this._associated);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardController _controller = DashboardController();
  BuildContext _gContext;

  List<String> _listAdmScreens = [
    "Associados",
    "Financeiro",
    "Eventos",
    "Parcerias",
    "Boutique",
  ];

  List<String> _listAdmScreensDesc = [
    "Harleyros associados ao Harley Club",
    "Registro de pagamento das mensalidades dos associados",
    "Informações sobre viagens, encontros, passeios, etc.",
    "Empresas com promoções oferecidas ao Harley Club",
    "Produtos da marca Harley Club (camisas, bonés, etc)",
  ];

  List<IconData> _listAdmIcons = [
    Icons.people_alt_rounded,
    Icons.monetization_on,
    Icons.event,
    Icons.emoji_people,
    Icons.wallet_giftcard,
  ];

  List<Widget> _listAdmWidgets;

  @override
  void initState() {
    //_controller = Provider.of<AssociatedController>(context, listen: false);
    _controller.associated = widget._associated;
    _controller.init();
    _listAdmWidgets = [
      AssociatedListPage(widget._user),
      PaymentListPage(widget._user),
      EventCalendarPage(widget._user),
      PartnershipListPage(widget._user),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _gContext = context;
    return Scaffold(
        body: Stack(
          children: <Widget>[_dashBg(), _content()],
        ),
        drawer: _drawr(),
        drawerEdgeDragWidth: 50,
        drawerScrimColor: Colors.black87);
  }

  _drawr() => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Text(
              'Ladies Harley Club',
              textAlign: TextAlign.center,
            ),
            UserAccountsDrawerHeader(
              accountName: Text(
                widget._user == 'admin'
                    ? 'Administrador'
                    : widget._associated.name,
              ),
              accountEmail: Text(
                widget._user == 'admin'
                    ? 'harleyclubslz@gmail.com'
                    : widget._associated.email,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/imgs/ladies.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Dark:'),
                Container(
                  child: Switch(
                    activeColor: Colors.orangeAccent,
                    value: AppController.instance.isDarkTheme,
                    onChanged: (value) {
                      setState(() {
                        AppController.instance.changeTheme();
                      });
                    },
                  ),
                ),
              ],
            ),
            _buildDrawerMenu(),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Sobre o HCSlz App"),
              onTap: () async {
                await _controller.loadAboutPage(_gContext);
                Navigator.pop(_gContext);
              },
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(_gContext);
              },
            ),
          ],
        ),
      );

  _buildDrawerMenu() =>
      (widget._user == 'admin' ? _menuAdm() : _menuAssociated());

  _menuAdm() => Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Acesso"),
            onTap: () {
              Navigator.pop(_gContext);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Documentos"),
            onTap: () {
              Navigator.pop(_gContext);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Associados"),
            onTap: () {
              Navigator.pop(_gContext);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Financeiro"),
            onTap: () {
              Navigator.pop(_gContext);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Eventos"),
            onTap: () {
              Navigator.pop(_gContext);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Parcerias"),
            onTap: () {
              Navigator.pop(_gContext);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Boutique"),
            onTap: () {
              Navigator.pop(_gContext);
            },
          ),
        ],
      );

  _menuAssociated() => Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Associado"),
            onTap: () async {
              await _controller.loadAssociatedUpdatePage(
                _gContext,
                widget._user,
                widget._associated.id,
              );
              Navigator.pop(_gContext);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Financeiro"),
            onTap: () async {
              await _controller.loadPaymentAssociatedPage(
                _gContext,
                widget._user,
                widget._associated,
              );
              Navigator.pop(_gContext);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Carteira Harley Club"),
            onTap: () async {
              await _controller.loadDigitalIdentityPage(
                _gContext,
                widget._associated,
              );
              Navigator.pop(_gContext);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Parcerias"),
            onTap: () async {
              await _controller.loadPartnershipListPage(
                _gContext,
                widget._user,
              );
              Navigator.pop(_gContext);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Eventos"),
            onTap: () async {
              await _controller.loadEventCalendarPage(
                _gContext,
                widget._user,
              );
              Navigator.pop(_gContext);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Códigos DTC"),
            onTap: () async {
              await _controller.loadDtcCodeDashboardPage(_gContext);
              Navigator.pop(_gContext);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Boutique"),
            onTap: () {
              Navigator.pop(_gContext);
            },
          ),
        ],
      );

  _dashBg() => Column(
        children: <Widget>[
          Expanded(
            child: Container(color: Colors.deepOrange[300]),
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 2,
          ),
        ],
      );

  _content() => Container(
        child: Column(
          children: <Widget>[
            _header(),
            _bar(),
            _grid(),
          ],
        ),
      );

  _header() => ListTile(
        contentPadding: EdgeInsets.only(left: 10, right: 20, top: 30),
        title: Text(
          widget._user == 'admin'
              ? 'Olá, Administrador'
              : 'Olá, ${_controller.getFirstName(widget._associated.name)}',
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
        subtitle: Text(
          widget._user == 'admin'
              ? 'harleyclubslz@gmail.com'
              : widget._associated.email,
          style: TextStyle(color: Colors.white60),
        ),
        trailing: widget._user == 'admin'
            ? null
            : Observer(
                builder: (_) => CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
/*                  backgroundImage: _controller.photoPath != null
                      ? PhotoImageProvider().getImageProvider(
                          File(_controller.photoPath),
                        )
                      : PhotoImageProvider().getImageProvider(
                          File('assets/imgs/noImage.png'),
                        ),*/

                  backgroundImage: _controller.photoUrl != null
                      ? NetworkImage(_controller.photoUrl)
                      : PhotoImageProvider().getImageProvider(
                          File('assets/imgs/noImage.png'),
                        ),
/*                  backgroundImage: _controller.photoPath != null
                      ? NetworkImage(_controller.photoPath)
                      : PhotoImageProvider().getImageProvider(
                          File('assets/imgs/noImage.png'),
                        ),*/
                ),
              ),
      );

  _bar() => (widget._user != 'admin'
      ? SizedBox()
      : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _BarButton(
              'Acesso',
              'Requisições de acesso',
              Icons.send_to_mobile,
              onClick: () {
                Navigator.push(
                  _gContext,
                  MaterialPageRoute(
                      builder: (_gContext) => AccessRequestListPage()),
                );
              },
            ),
            _BarButton(
              'Documentos',
              'Atas, estatuto, etc',
              Icons.file_copy_outlined,
              onClick: () {
                //_showContactsList(context);
              },
            ),
          ],
        ));

  _grid() => (widget._user == 'admin' ? _gridAdm() : _gridAssociated());

  _gridAssociated() => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridView.count(
            //crossAxisSpacing: 10,
            //mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            children: <Widget>[
              _GridButton(
                title: "Associado",
                image: "assets/imgs/user.png",
                context: _gContext,
                onClick: () {
                  _controller.loadAssociatedUpdatePage(
                    _gContext,
                    widget._user,
                    widget._associated.id,
                  );
                },
              ),
              _GridButton(
                title: "Financeiro",
                image: "assets/imgs/financeiro.png",
                context: _gContext,
                onClick: () {
                  _controller.loadPaymentAssociatedPage(
                    _gContext,
                    widget._user,
                    widget._associated,
                  );
                },
              ),
              _GridButton(
                title: "Carteira Harley Club",
                image: "assets/imgs/carteirad.png",
                context: _gContext,
                onClick: () {
                  _controller.loadDigitalIdentityPage(
                    _gContext,
                    widget._associated,
                  );
                },
              ),
              _GridButton(
                title: "Parcerias",
                image: "assets/imgs/parcerias.png",
                context: _gContext,
                onClick: () {
                  _controller.loadPartnershipListPage(
                    _gContext,
                    widget._user,
                  );
                },
              ),
              _GridButton(
                title: "Eventos",
                image: "assets/imgs/eventos.png",
                context: _gContext,
                onClick: () {
                  _controller.loadEventCalendarPage(
                    _gContext,
                    widget._user,
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
              _GridButton(
                title: "Codigos DTC",
                image: "assets/imgs/codigosdtc.png",
                context: _gContext,
                onClick: () {
                  _controller.loadDtcCodeDashboardPage(_gContext);
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
              _GridButton(
                title: "Boutique",
                image: "assets/imgs/boutique.png",
                context: _gContext,
                onClick: () {
                  Navigator.push(
                    _gContext,
                    MaterialPageRoute(
                        builder: (gContext) => BoutiqueListPage()),
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
              _GridButton(
                title: "O Harley Club",
                image: "assets/imgs/logo.png",
                context: _gContext,
                onClick: () {
                  _controller.loadAboutPage(_gContext);
                },
              ),
            ],
          ),
        ),
      );

  _gridAdm() => Expanded(
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
