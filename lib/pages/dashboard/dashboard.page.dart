import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../common/associated.profiles.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/app.controller.dart';
import 'package:hcslzapp/controllers/dashboard.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/pages/access.request/access.request.list.page.dart';
import 'package:hcslzapp/pages/associated/associated.list.page.dart';
/*
import 'package:hcslzapp/pages/event/event.calendar.page.dart';
import 'package:hcslzapp/pages/management/management.list.page.dart';
import 'package:hcslzapp/pages/partnership/partnership.list.adm.page.dart';
import 'package:hcslzapp/pages/payment/payment.list.page.dart';
*/
import 'package:hcslzapp/pages/splash/splash.page.dart';

const String _labelAppTitle = 'HCSlz App';
const String _labelDarkTheme = 'Tema Escuro';
const String _labelChangeProfile = 'Trocar Perfil de Acesso';
const String _labelLogout = 'Logout';
const String _labelLogoutConf = 'Confirma Logout?';
const String _labelLadiesHC = 'Ladies Harley Club';
const String _labelAdm = 'Administrador';
const String _labelAdmEmail = 'harleyclubslz@gmail.com';
const String _labelAboutApp = 'Sobre o HCSlz App';
const String _labelAppVersion = '1.0.0';
const String _pathLadiesImage = 'assets/imgs/ladies.jpg';
const String _pathNoImage = 'assets/imgs/noImage.png';
const String _labelAccessRequest = 'Acesso';
const String _labelAccessRequestDescr = 'Requisições de acesso';
const String _labelAdministration = 'Administração';
const String _labelAdministrationDescr = 'Administradores do App';
const String _labelAssociated = 'Associado';
const String _pathAssociatedImage = 'assets/imgs/user.png';
const String _labelPayment = 'Mensalidades';
const String _pathPaymentImage = 'assets/imgs/financeiro.png';
const String _labelDigitalIdentity = 'Carteira Harley Club';
const String _pathDigitalIdentityImage = 'assets/imgs/carteirad.png';
const String _labelPartnership = 'Parcerias';
const String _pathPartnershipImage = 'assets/imgs/parcerias.png';
const String _labelEvent = 'Eventos';
const String _pathEventImage = 'assets/imgs/eventos.png';
const String _labelDTC = 'Codigos DTC';
const String _pathDTCImage = 'assets/imgs/codigosdtc.png';
const String _labelAboutHarleyClub = 'O Harley Club';
const String _pathAboutHarleyClubImage = 'assets/imgs/logo.png';

const List<String> _listAdmScreens = [
  "Associados",
  "Mensalidades",
  "Eventos",
  "Parcerias",
  //"Boutique",
];

const List<String> _listAdmScreensDesc = [
  "Harleyros associados ao Harley Club",
  "Registro de pagamento das mensalidades dos associados",
  "Informações sobre viagens, encontros, passeios, etc.",
  "Empresas com promoções oferecidas ao Harley Club",
  //"Produtos da marca Harley Club (camisas, bonés, etc)",
];

const List<IconData> _listAdmIcons = [
  Icons.people_alt_rounded,
  Icons.monetization_on,
  Icons.event,
  Icons.emoji_people,
  //Icons.wallet_giftcard,
];

// ignore: must_be_immutable
class DashboardPage extends StatefulWidget {
  Associated _associated;

  DashboardPage(this._associated);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardController _controller = DashboardController();
  late BuildContext _gContext;

  late List<Widget> _listAdmWidgets;

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
      //PaymentListPage(_controller.selectedProfile),
      //EventCalendarPage(_controller.selectedProfile),
      //PartnershipListAdmPage(),
    ];
    return Scaffold(
      appBar: _appBar(),
      drawer: _drawr(),
      drawerEdgeDragWidth: 50,
      drawerScrimColor: Colors.black87,
      body: _widgets(),
    );
  }

  AppBar _appBar() => AppBar(
        elevation: 1.0,
        leading: Builder(
          builder: (context) => Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu_rounded),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ],
          ),
        ),
        title: Text(
          _labelAppTitle,
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
        centerTitle: true,
        toolbarHeight: 40.0,
        actions: <Widget>[
          PopupMenuButton<String?>(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        _labelDarkTheme,
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Container(
                        child: Switch(
                          activeColor: Colors.orangeAccent,
                          value: AppController.instance.isDarkTheme,
                          onChanged: (value) {
                            setState(() {
                              AppController.instance.changeTheme();
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                _controller.isAdmin()
                    ? PopupMenuItem(
                        child: GestureDetector(
                          child: Text(
                            _labelChangeProfile,
                            style: TextStyle(fontSize: 12.0),
                          ),
                          onTap: () {
                            setState(() {
                              _controller.changeProfile();
                              print(_controller.selectedProfile);
                              _widgets();
                              Navigator.pop(context);
                            });
                          },
                        ),
                      )
                    : PopupMenuItem(
                        child: null,
                      ),
                PopupMenuItem(
                  child: GestureDetector(
                    child: Text(
                      _labelLogout,
                      style: TextStyle(fontSize: 12.0),
                    ),
                    onTap: () async {
                      Navigator.pop(context);
                      var response = await showDialog(
                          context: context,
                          builder: (context) {
                            return TransactionAuthDialog(msg: _labelLogoutConf);
                          });
                      if (response) {
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
                      }
                    },
                  ),
                )
              ];
            },
          )
        ],
        backgroundColor: Colors.deepOrange[300],
      );

  _widgets() => Stack(
        children: <Widget>[
          _dashBg(),
          _content(),
        ],
      );

  _drawr() => Drawer(
        child: ListView(
          children: <Widget>[
            Text(
              _labelLadiesHC,
              textAlign: TextAlign.center,
            ),
            UserAccountsDrawerHeader(
              accountName: Text(
                _controller.selectedProfile == ADMIN
                    ? _labelAdm
                    : widget._associated.name,
              ),
              accountEmail: Text(
                _controller.selectedProfile == ADMIN
                    ? _labelAdmEmail
                    : widget._associated.email,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(_pathLadiesImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(_labelDarkTheme),
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
            _controller.isAdmin()
                ? ListTile(
                    leading: Icon(Icons.wifi_protected_setup),
                    title: Text(_labelChangeProfile),
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
              title: Text(_labelAboutApp),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationVersion: _labelAppVersion,
                  applicationName: _labelAppTitle,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: const Text(
                        'Este aplicativo é propriedade do Harley Club de São '
                        'Luís-MA.',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: const Text(
                        'Seu conteúdo e utilização são '
                        'restritos a associados.',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: const Text(
                        'Desenvolvedor: Adalberto Jr.',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: const Text(
                        'Email: atajr.650@gmail.com',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: const Text(
                        'Tel: (98) 99120-7728',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2, bottom: 20),
                      child: const Text(
                        'Copyright 2020-2021 Brasil',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                    SizedBox(
                      height: 70.0,
                      child: Container(
                        child: Image.asset(_pathAboutHarleyClubImage),
                      ),
                    ),
                  ],
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text(_labelLogout),
              onTap: () async {
                var response = await showDialog(
                    context: context,
                    builder: (context) {
                      return TransactionAuthDialog(msg: _labelLogoutConf);
                    });
                if (response) {
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
                }
              },
            ),
          ],
        ),
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
        contentPadding: EdgeInsets.only(left: 10, right: 20),
        title: Text(
          _controller.selectedProfile == ADMIN
              ? 'Olá, ' + _labelAdm
              : 'Olá, ${_controller.getFirstName(widget._associated.name)}',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        subtitle: Text(
          _controller.selectedProfile == ADMIN
              ? _labelAdmEmail
              : widget._associated.email,
          style: TextStyle(color: Colors.white60, fontSize: 12.0),
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
                  backgroundImage: _controller.photoUrl != null
                      ? NetworkImage(_controller.photoUrl)
                      : PhotoImageProvider().getImageProvider(
                          File(_pathNoImage),
                        ) as ImageProvider,
                ),
              ),
      );

  _bar() => (_controller.selectedProfile != ADMIN
      ? SizedBox()
      : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BarButton(
              _labelAccessRequest,
              _labelAccessRequestDescr,
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
              _labelAdministration,
              _labelAdministrationDescr,
              Icons.admin_panel_settings,
              onClick: () {
/*                Navigator.push(
                  _gContext,
                  MaterialPageRoute(
                      builder: (_gContext) => ManagementListPage()),
                );*/
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
                  title: _labelAssociated,
                  image: _pathAssociatedImage,
                  context: _gContext,
                  onClick: () {
                    _controller.loadAssociatedUpdatePage(
                      _gContext,
                      widget._associated.id,
                    );
                  },
                ),
                GridButton(
                  title: _labelPayment,
                  image: _pathPaymentImage,
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
                  title: _labelDigitalIdentity,
                  image: _pathDigitalIdentityImage,
                  context: _gContext,
                  onClick: () {
                    _controller.loadDigitalIdentityPage(
                      _gContext,
                      widget._associated,
                    );
                  },
                ),
                GridButton(
                  title: _labelPartnership,
                  image: _pathPartnershipImage,
                  context: _gContext,
                  onClick: () {
                    _controller.loadPartnershipListAssociatedPage(
                      _gContext,
                    );
                  },
                ),
                GridButton(
                  title: _labelEvent,
                  image: _pathEventImage,
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
                  title: _labelDTC,
                  image: _pathDTCImage,
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
/*                GridButton(
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
                ),*/
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
                  title: _labelAboutHarleyClub,
                  image: _pathAboutHarleyClubImage,
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
                //color: Colors.black,
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
                    //color: Colors.black,
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
