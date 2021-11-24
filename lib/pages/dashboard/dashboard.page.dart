import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/associated.profiles.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/controllers/app.controller.dart';
import 'package:hcslzapp/controllers/dashboard.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/pages/access.request/access.request.list.page.dart';
import 'package:hcslzapp/pages/associated/associated.list.page.dart';
import 'package:hcslzapp/pages/boutique/boutique.list.page.dart';
import 'package:hcslzapp/pages/event/event.calendar.page.dart';
import 'package:hcslzapp/pages/management/management.list.page.dart';
import 'package:hcslzapp/pages/partnership/partnership.list.page.dart';
import 'package:hcslzapp/pages/payment/payment.list.page.dart';
import 'package:hcslzapp/pages/splash/splash.page.dart';

// ignore: must_be_immutable
class DashboardPage extends StatefulWidget {
  Associated _associated;

  DashboardPage(this._associated);

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _gContext = context;
    _listAdmWidgets = [
      AssociatedListPage(),
      PaymentListPage(_controller.selectedProfile),
      EventCalendarPage(_controller.selectedProfile),
      PartnershipListPage(_controller.selectedProfile),
    ];
    return Scaffold(
        body: _widgets(),
        drawer: _drawr(),
        drawerEdgeDragWidth: 50,
        drawerScrimColor: Colors.black87);
  }

  _widgets() => Stack(
        children: <Widget>[
          _dashBg(),
          _content(),
        ],
      );

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
                _controller.selectedProfile == ADMIN
                    ? 'Administrador'
                    : widget._associated.name,
              ),
              accountEmail: Text(
                _controller.selectedProfile == ADMIN
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
                Text('Tema Escuro:'),
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
            //_buildDrawerMenu(),
            //Divider(),
            _controller.isAdmin()
                ? ListTile(
                    leading: Icon(Icons.wifi_protected_setup),
                    title: Text("Trocar Perfil de Acesso"),
                    onTap: () async {
                      setState(() {
                        _controller.changeProfile();
                        print(_controller.selectedProfile);
                        _widgets();
                        Navigator.pop(_gContext);
                      });
                    },
                  )
                : Container(),
            //Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Sobre o HCSlz App"),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationVersion: '1.0.0',
                  applicationName: 'HCSlz App',
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        'Este aplicativo é propriedade do Harley Club de Ŝão '
                        'Luís - MA, Brasil. Suas informações e  utilização são '
                        'restritos a associados.',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'Desenvolvedor: Adalberto Jr.',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        'email: atajr.650@gmail.com',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        'tel: (98) 99120-7728',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text("Logout"),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  // the new route
                  MaterialPageRoute(
                    builder: (BuildContext context) => Splash(),
                  ),

                  // this function should return true when we're done removing routes
                  // but because we want to remove all other screens, we make it
                  // always return false
                  (Route route) => false,
                );
              },
            ),
          ],
        ),
      );

/*  _menuAdm() => Column(
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

  _buildDrawerMenu() =>
      (_controller.profile == ADMIN ? _menuAdm() : _menuAssociated());

  _menuAssociated() => Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Associado"),
            onTap: () async {
              await _controller.loadAssociatedUpdatePage(
                _gContext,
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
                _controller.isAdmin(),
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

 */
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
          _controller.selectedProfile == ADMIN
              ? 'Olá, Administrador'
              : 'Olá, ${_controller.getFirstName(widget._associated.name)}',
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
        subtitle: Text(
          _controller.selectedProfile == ADMIN
              ? 'harleyclubslz@gmail.com'
              : widget._associated.email,
          style: TextStyle(color: Colors.white60),
        ),
        trailing: _controller.selectedProfile == ADMIN
            ? CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30.0,
                child: Icon(
                  Icons.admin_panel_settings,
                  size: 50.0,
                  color: Colors.orange,
                ),
              )
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

  _bar() => (_controller.selectedProfile != ADMIN
      ? SizedBox()
      : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BarButton(
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
            BarButton(
              'Perfis',
              'Administradores do App',
              Icons.admin_panel_settings,
              onClick: () {
                Navigator.push(
                  _gContext,
                  MaterialPageRoute(
                      builder: (_gContext) => ManagementListPage()),
                );
                //_showContactsList(context);
              },
            ),
          ],
        ));

  _grid() =>
      (_controller.selectedProfile == ADMIN ? _gridAdm() : _gridAssociated());

  _gridAssociated() => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Center(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              children: <Widget>[
                GridButton(
                  title: "Associado",
                  image: "assets/imgs/user.png",
                  context: _gContext,
                  onClick: () {
                    _controller.loadAssociatedUpdatePage(
                      _gContext,
                      widget._associated.id,
                    );
                  },
                ),
                GridButton(
                  title: "Financeiro",
                  image: "assets/imgs/financeiro.png",
                  context: _gContext,
                  onClick: () {
                    _controller.loadPaymentAssociatedPage(
                      _gContext,
                      _controller.isAdmin(),
                      widget._associated,
                    );
                  },
                ),
                GridButton(
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
                GridButton(
                  title: "Parcerias",
                  image: "assets/imgs/parcerias.png",
                  context: _gContext,
                  onClick: () {
                    _controller.loadPartnershipListPage(
                      _gContext,
                    );
                  },
                ),
                GridButton(
                  title: "Eventos",
                  image: "assets/imgs/eventos.png",
                  context: _gContext,
                  onClick: () {
                    _controller.loadEventCalendarPage(
                      _gContext,
                      _controller.selectedProfile,
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
                GridButton(
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
                GridButton(
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
        ),
      );

  _gridAdm() => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: ListView.builder(
            itemCount: _listAdmScreens.length,
            itemBuilder: (BuildContext context, int index) => Card(
              color: Colors.deepOrange[100],
              shadowColor: Colors.black,
              child: _listItem(context, index),
            ),
          ),
        ),
      );

/*  Widget _listItem(BuildContext context, int index) => Card(
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
      );*/

  Widget _listItem(BuildContext context, int index) => Column(
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
      );
}
