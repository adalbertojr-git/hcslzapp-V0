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
    photoUrl = associated.photoUrl;
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
