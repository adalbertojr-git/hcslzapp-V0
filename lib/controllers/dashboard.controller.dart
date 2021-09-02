import 'package:flutter/material.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/pages/about/about.page.dart';
import 'package:hcslzapp/pages/associated/associated.update.page.dart';
import 'package:hcslzapp/pages/digital.identity/digital.identity.page.dart';
import 'package:hcslzapp/pages/dtc.code/dtc.code.dashboard.page.dart';
import 'package:hcslzapp/pages/event/event.calendar.page.dart';
import 'package:hcslzapp/pages/partnership/partnership.list.page.dart';
import 'package:hcslzapp/pages/payment/payment.associated.page.dart';
import 'package:mobx/mobx.dart';

part 'dashboard.controller.g.dart';

class DashboardController = DashboardControllerBase with _$DashboardController;

abstract class DashboardControllerBase with Store {
  @observable
  String photoUrl;

  @observable
  Associated associated;

  init() {
    photoUrl = associated == null ? "" : associated.photoUrl;
  }

  @action
  setPhoto(String value) {
    photoUrl = value;
    associated.photoUrl = photoUrl;
  }

  String getFirstName(String fullName) {
    var names = fullName.split(' ');
    return names[0];
  }

  Future<void> loadAssociatedUpdatePage(
    BuildContext context,
    String user,
    int id,
  ) async {
    var _photoUrl = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AssociatedUpdatePage(user, id),
      ),
    );
    if (_photoUrl != null) {
      setPhoto(_photoUrl);
    }
  }

  loadPaymentAssociatedPage(
    BuildContext context,
    String user,
    Associated associated,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentAssociatedPage(user, associated),
      ),
    );
  }

  loadDigitalIdentityPage(
    BuildContext context,
    Associated associated,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DigitalIdentityPage(associated),
      ),
    );
  }

  loadPartnershipListPage(
    BuildContext context,
    String user,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PartnershipListPage(user),
      ),
    );
  }

  loadEventCalendarPage(
    BuildContext context,
    String user,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventCalendarPage(user),
      ),
    );
  }

  loadDtcCodeDashboardPage(
    BuildContext context,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DtcCodeDashboardPage(),
      ),
    );
  }

  loadAboutPage(
      BuildContext context,
      ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AboutPage(),
      ),
    );
  }
}

class GridButton extends StatelessWidget {
  final String title;
  final String image;
  final BuildContext context;
  final Color color = Colors.white10;
  final Function onClick;

  GridButton({this.title, this.image, this.context, this.onClick});

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

class BarButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function onClick; //callback

  BarButton(this.title, this.subtitle, this.icon, {@required this.onClick});

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