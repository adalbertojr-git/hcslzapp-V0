import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/pages/associated/month.birthdays.list.page.dart';
import 'package:hcslzapp/pages/boutique/product.list.page.dart';
import 'package:hcslzapp/pages/login/login.page.dart';
import 'package:hcslzapp/pages/management/management.list.page.dart';
import 'package:hcslzapp/pages/notification/head.notification.list.adm.page.dart';
import 'package:hcslzapp/pages/notification/head.notification.list.associated.page.dart';
import 'package:hcslzapp/pages/partnership/partnership.list.adm.page.dart';
import 'package:hcslzapp/pages/password/change.password.page.dart';
import 'package:hcslzapp/pages/payment/payment.list.page.dart';
import '../../common/associated.profiles.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/app.controller.dart';
import 'package:hcslzapp/controllers/dashboard.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/pages/access.request/access.request.list.page.dart';
import 'package:hcslzapp/pages/associated/associated.list.page.dart';
import '../../common/injection.dart';
import '../../common/settings.dart';
import '../../components/progress.dart';
import '../event/event.calendar.page.dart';

const String _labelAppTitle = 'HCSlz App';
const String _labelTheme = 'Alterar Tema';
const String _labelChangeProfile = 'Trocar Perfil de Acesso';
const String _labelChangePassword = 'Alterar senha';
const String _labelLogout = 'Logout';
const String _labelLogoutConf = 'Confirma Logout?';
const String _labelLadiesHC = 'Ladies Harley Club';
const String _labelAdm = 'Administrador';
const String _labelAdmEmail = 'harleyclubslz@gmail.com';
const String _labelAboutApp = 'Sobre o HCSlz App';
const String _pathLadiesImage = 'assets/imgs/ladies.jpg';
const String _pathNoImage = 'assets/imgs/noImage.png';
const String _labelBirthdaysMonth = 'Aniversariantes';
const String _labelBirthdaysMonthDescr = 'Aniversariantes do mês';
const String _labelNotification = 'Avisos';
const String _labelNotificationDescr = 'Avisos da Diretoria';
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
const String _labelBoutique = 'Boutique';
const String _pathBoutiqueImage = 'assets/imgs/boutique.png';
const String _labelAboutHarleyClub = 'O Harley Club';
const String _pathAboutHarleyClubImage = 'assets/imgs/logo.png';

const List<String> _listAdmScreens = [
  "Associados",
  "Mensalidades",
  "Eventos",
  "Parcerias",
  "Avisos",
  // "Loja",
];

const List<String> _listAdmScreensDesc = [
  "Harleyros associados ao Harley Club",
  "Registro das mensalidades pagas",
  "Viagens, encontros, passeios, etc.",
  "Empresas parceiras do Harley Club",
  "Avisos da Diretoria aos harleyros",
  // "Produtos da marca Harley Club",
];

const List<IconData> _listAdmIcons = [
  Icons.people_alt_rounded,
  Icons.monetization_on,
  Icons.event,
  Icons.emoji_people,
  Icons.announcement,
  // Icons.wallet_giftcard,
];

class DashboardPage extends StatefulWidget {
  final int associatedId;

  DashboardPage(this.associatedId);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController _controller = DashboardController();
  late List<Widget> _listAdmWidgets;

  @override
  void initState() {
    super.initState();
    _controller.getFuture(widget.associatedId).then((value) {
      loadAssociatedSingleton(value.first);
    });
    _controller.selectedProfile = ASSOCIATED;
  }

  @override
  Widget build(BuildContext context) {
    _listAdmWidgets = [
      AssociatedListPage(),
      PaymentListPage(_controller.selectedProfile),
      EventCalendarPage(_controller.selectedProfile),
      PartnershipListAdmPage(),
      HeadNotificationListAdmPage(),
      // ProductListPage(),
    ];

    return Observer(
      builder: (_) => Scaffold(
        appBar: _appBar(),
        drawer: _drawr(),
        drawerEdgeDragWidth: 50,
        drawerScrimColor: Colors.black87,
        body: FutureBuilder<List<Associated>>(
          future: _controller.future,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Progress();
              case ConnectionState.active:
                break;
              default:
                if (snapshot.hasError) {
                  return CenteredMessage(
                    title: ERROR,
                    message: snapshot.error.toString(),
                  );
                } else {
                  if ((snapshot.data?.length)! > 0) {
                    _controller.setAssociated(locator.get<Associated>());
                    _controller.setPhotoURL();
                    return _widgets();
                  } else
                    return CenteredMessage(
                      title: WARNING,
                      message: NOTEXIST,
                    );
                }
            } //switch (snapshot.connectionState)
            return CenteredMessage(
              title: ERROR,
              message: UNKNOWN,
            );
          },
        ),
      ),
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
          GestureDetector(
            child: Icon(
              AppController.instance.isDarkTheme
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: AppController.instance.isDarkTheme
                  ? Colors.white
                  : Colors.black,
            ),
            onTap: () {
              setState(() {
                AppController.instance.changeTheme();
              });
            },
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Icon(Icons.power_settings_new),
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
                    builder: (BuildContext context) => MyCustomLoginUI(),
                  ),

                  // this function should return true when we're done removing routes
                  // but because we want to remove all other screens, we make it
                  // always return false
                  (Route route) => false,
                );
              }
            },
          ),
          SizedBox(
            width: 10,
          ),
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
                    : _controller.associated.name,
              ),
              accountEmail: Text(
                _controller.selectedProfile == ADMIN
                    ? _labelAdmEmail
                    : _controller.associated.email,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(_pathLadiesImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                AppController.instance.isDarkTheme
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              title: Text(_labelTheme),
              onTap: () {
                setState(() {
                  AppController.instance.changeTheme();
                });
              },
            ),
            ListTile(
              enabled: _controller.isAdmin(),
              leading: Icon(Icons.wifi_protected_setup),
              title: Text(_labelChangeProfile),
              onTap: () async {
                setState(() {
                  _controller.changeProfile();
                  print(_controller.selectedProfile);
                  _widgets();
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              enabled: _controller.selectedProfile == ADMIN ? false : true,
              leading: Icon(Icons.password),
              title: Text(_labelChangePassword),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ChangePasswordPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(_labelAboutApp),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationVersion: APP_VERSION,
                  applicationName: _labelAppTitle,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: const Text(
                        'Este aplicativo é propriedade do Harley Club de São '
                        'Luís-MA.',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: const Text(
                        'Seu conteúdo e utilização são '
                        'restritos a associados.',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: const Text(
                        'Desenvolvedor: Adalberto Jr.',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: const Text(
                        'Email: atajr.650@gmail.com',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: const Text(
                        'Tel: (98) 99120-7728',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2, bottom: 20),
                      child: const Text(
                        'Copyright 2023 Brasil',
                        style: TextStyle(fontSize: 12.0),
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
                      builder: (BuildContext context) => MyCustomLoginUI(),
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
            child: Container(
                color: _controller.selectedProfile == ADMIN
                    ? Colors.black87
                    : Colors.deepOrange[300]),
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 1,
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
              : 'Olá, ${_controller.getFirstName(_controller.associated.name)}',
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
        subtitle: Text(
          _controller.selectedProfile == ADMIN
              ? _labelAdmEmail
              : _controller.associated.email,
          style: TextStyle(color: Colors.white60, fontSize: 14.0),
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
                  backgroundImage: _controller.photoUrl != ''
                      ? NetworkImage(_controller.photoUrl)
                      : PhotoImageProvider().getImageProvider(
                          File(_pathNoImage),
                        ) as ImageProvider,
                ),
              ),
      );

  _bar() => (_controller.selectedProfile != ADMIN
      ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BarButton(
              _labelBirthdaysMonth,
              _labelBirthdaysMonthDescr,
              Icons.cake,
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_gContext) => MonthBirthdaysListPage()),
                );
              },
            ),
            BarButton(
              _labelNotification,
              _labelNotificationDescr,
              Icons.announcement,
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_gContext) =>
                          HeadNotificationListAssociatedPage()),
                );
              },
            ),
          ],
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BarButton(
              _labelAccessRequest,
              _labelAccessRequestDescr,
              Icons.send_to_mobile,
              onClick: () {
                Navigator.push(
                  context,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_gContext) => ManagementListPage()),
                );
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
                  context: context,
                  onClick: () {
                    _controller.loadAssociatedUpdatePage(
                      context,
                      _controller.associated.id,
                    );
                  },
                ),
                GridButton(
                  title: _labelPayment,
                  image: _pathPaymentImage,
                  context: context,
                  onClick: () {
                    _controller.loadPaymentAssociatedPage(
                      context,
                      _controller.isAdmin(),
                      _controller.associated,
                    );
                  },
                ),
                GridButton(
                  title: _labelDigitalIdentity,
                  image: _pathDigitalIdentityImage,
                  context: context,
                  onClick: () {
                    _controller.loadDigitalIdentityPage(
                      context,
                      //_associated,
                    );
                  },
                ),
                GridButton(
                  title: _labelPartnership,
                  image: _pathPartnershipImage,
                  context: context,
                  onClick: () {
                    _controller.loadPartnershipListAssociatedPage(
                      context,
                    );
                  },
                ),
                GridButton(
                  title: _labelEvent,
                  image: _pathEventImage,
                  context: context,
                  onClick: () {
                    _controller.loadEventCalendarPage(
                      context,
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
                  context: context,
                  onClick: () {
                    _controller.loadDtcCodeDashboardPage(context);
                  },
                ),

/*                GridButton(
                  title: _labelBoutique,
                  image: _pathBoutiqueImage,
                  context: context,
                  onClick: () {
                    _controller.loadBoutiquePage(context);
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
                GridButton(
                  title: _labelAboutHarleyClub,
                  image: _pathAboutHarleyClubImage,
                  context: context,
                  onClick: () {
                    _controller.loadAboutPage(context);
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
            itemBuilder: (BuildContext context, int index) => Container(
              height: 90,
              child: Card(
                color: Colors.deepOrange[100],
                shadowColor: Colors.black,
                child: _listItem(context, index),
              ),
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
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _listAdmScreensDesc[index],
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => _listAdmWidgets[index]),
              );
            },
          )
        ],
      );
}
