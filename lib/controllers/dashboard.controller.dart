import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hcslzapp/pages/event/event.calendar.page.dart';
import 'package:hcslzapp/pages/partnership/partnership.list.associated.page.dart';
import 'package:hcslzapp/pages/payment/payment.associated.page.dart';
import '../models/role.dart';
import '../common/associated.profiles.dart';
import '../models/associated.dart';
import '../models/template.dart';
import '../pages/about/about.page.dart';
import '../pages/associated/associated.update.page.dart';
import 'package:hcslzapp/pages/digital.identity/digital.identity.page.dart';
import 'package:hcslzapp/pages/dtc.code/dtc.code.dashboard.page.dart';
import 'package:mobx/mobx.dart';

import '../repositories/associated.repo.dart';

part 'dashboard.controller.g.dart';

class DashboardController = DashboardControllerBase with _$DashboardController;

abstract class DashboardControllerBase with Store {
  @observable
  String photoUrl = '';

  @observable
  Associated associated = Template().loadAssociated();

  @observable
  String selectedProfile = '';

  @observable
  Future<List<Associated>> future = Future<List<Associated>>.value([]);

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

  @observable
  String errorMsg = "";

  Future<List<Associated>> findByIdToList(int id) {
    try {
      return ObservableFuture(
          _associatedRepo.findByIdToList(id).then((value) => value));
    } on HttpException catch (e) {
      print(e);
      errorMsg = "$e";
    } on Exception catch (e) {
      print(e);
      errorMsg = "$e";
    } catch (e) {
      print(e);
      errorMsg = "$e";
    }
    return Future.error(errorMsg);
  }

  Future<List<Associated>> getFuture(int id) => future = findByIdToList(id);

  @action
  setAssociated(Associated associated) => this.associated = associated;

  @action
  setPhotoURL() => this.photoUrl = associated.photoUrl;

  @action
  setPhoto(String value) {
    photoUrl = value;
    associated.photoUrl = photoUrl;
  }

  bool isAdmin() {
    return associated.authenticate.roles.any((Role r) => r.profile == ADMIN);
  }

  @action
  changeProfile() =>
      selectedProfile = (selectedProfile == ADMIN ? ASSOCIATED : ADMIN);

  String getFirstName(String fullName) {
    var names = fullName.split(' ');
    return names[0];
  }

  Future<void> loadAssociatedUpdatePage(
    BuildContext context,
    int id,
  ) async {
    var _photoUrl = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AssociatedUpdatePage(selectedProfile, null),
      ),
    );
    if (_photoUrl != null) {
      setPhoto(_photoUrl);
    }
  }

  loadPaymentAssociatedPage(
    BuildContext context,
    bool isAdmin,
    Associated associated,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PaymentAssociatedPage(selectedProfile, associated),
      ),
    );
  }

  loadDigitalIdentityPage(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DigitalIdentityPage(),
      ),
    );
  }

  loadPartnershipListAssociatedPage(
    BuildContext context,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PartnershipListAssociatedPage(),
      ),
    );
  }

  loadEventCalendarPage(
    BuildContext context,
    String selectedProfile,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventCalendarPage(selectedProfile),
        //EventCalendarPage(user),
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

  GridButton(
      {required this.title,
      required this.image,
      required this.context,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrange[100],
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

  BarButton(this.title, this.subtitle, this.icon, {required this.onClick});

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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.0,
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
