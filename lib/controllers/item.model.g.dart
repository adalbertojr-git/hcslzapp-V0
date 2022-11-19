// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemModel on ItemModelBase, Store {
  late final _$idAtom = Atom(name: 'ItemModelBase.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nameAtom = Atom(name: 'ItemModelBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$phoneAtom = Atom(name: 'ItemModelBase.phone', context: context);

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'ItemModelBase.status', context: context);

  @override
  String? get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String? value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$authenticateAtom =
      Atom(name: 'ItemModelBase.authenticate', context: context);

  @override
  Authenticate? get authenticate {
    _$authenticateAtom.reportRead();
    return super.authenticate;
  }

  @override
  set authenticate(Authenticate? value) {
    _$authenticateAtom.reportWrite(value, super.authenticate, () {
      super.authenticate = value;
    });
  }

  late final _$emailAtom = Atom(name: 'ItemModelBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$userAtom = Atom(name: 'ItemModelBase.user', context: context);

  @override
  String? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'ItemModelBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$checkAtom = Atom(name: 'ItemModelBase.check', context: context);

  @override
  bool? get check {
    _$checkAtom.reportRead();
    return super.check;
  }

  @override
  set check(bool? value) {
    _$checkAtom.reportWrite(value, super.check, () {
      super.check = value;
    });
  }

  late final _$ItemModelBaseActionController =
      ActionController(name: 'ItemModelBase', context: context);

  @override
  dynamic setCheck(bool value) {
    final _$actionInfo = _$ItemModelBaseActionController.startAction(
        name: 'ItemModelBase.setCheck');
    try {
      return super.setCheck(value);
    } finally {
      _$ItemModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
phone: ${phone},
status: ${status},
authenticate: ${authenticate},
email: ${email},
user: ${user},
password: ${password},
check: ${check}
    ''';
  }
}
