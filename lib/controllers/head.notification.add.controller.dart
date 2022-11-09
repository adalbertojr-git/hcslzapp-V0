import 'package:flutter/material.dart';
import 'package:hcslzapp/models/head.notification.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:mobx/mobx.dart';

part 'head.notification.add.controller.g.dart';

class HeadNotificationAddController = HeadNotificationAddControllerBase
    with _$HeadNotificationAddController;

abstract class HeadNotificationAddControllerBase with Store {
  var formController;

  @observable
  late TextEditingController idCtrl = TextEditingController();

  @observable
  late TextEditingController? titleCtrl = TextEditingController();

  @observable
  late TextEditingController? notificationCtrl = TextEditingController();

  @observable
  HeadNotification headNotification = Template().loadHeadNotification();

  init() {
    _initTextFields();
    formController = FormController(
      title: headNotification.title,
      notification: headNotification.notification
    );
  }

  _initTextFields() {
    titleCtrl?.text = headNotification.title;
    notificationCtrl?.text = headNotification.notification;
  }

  add(BuildContext context) {
    idCtrl.text = "0";
    final int id = int.parse(idCtrl.text);
    final String title = titleCtrl!.text;
    final String notification = notificationCtrl!.text;
    if (title != '' && notification != '') {
      final headNotification = HeadNotification(
        id: id,
        title: title,
        notification: notification,
      );
      /*
      pop = manda resposta para o push (then)
      remove a tela da pilha de navegação. Ou seja, o push() adiciona uma tela
      à pilha, e o pop() a remove.
      */
      Navigator.pop(context, headNotification);
    }
  }

  String? validateTitle() {
    const String _labelTitleRequired = 'Título é obrigatório!!!';

    if (formController.title.isEmpty) {
      return _labelTitleRequired;
    }
    return null;
  }

  String? validateNotification() {
    const String _labelNotificationRequired = 'Descrição do aviso é obrigatória!!!';

    if (formController.notification.isEmpty) {
      return _labelNotificationRequired;
    }
    return null;
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({
    String? title,
    String? notification,
  }) {
    super.title = title;
    super.notification = notification;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? title;

  @observable
  String? notification;

  @action
  changeTitle(String value) => title = value;

  @action
  changeNotification(String value) => notification = value;
}
