// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemModel on ItemModelBase, Store {
  final _$idAtom = Atom(name: 'ItemModelBase.id');

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

  final _$nameAtom = Atom(name: 'ItemModelBase.name');

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

  final _$phoneAtom = Atom(name: 'ItemModelBase.phone');

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

  final _$statusAtom = Atom(name: 'ItemModelBase.status');

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

  final _$authenticateAtom = Atom(name: 'ItemModelBase.authenticate');

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

  final _$emailAtom = Atom(name: 'ItemModelBase.email');

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

  final _$checkAtom = Atom(name: 'ItemModelBase.check');

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

  final _$ItemModelBaseActionController =
      ActionController(name: 'ItemModelBase');

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
check: ${check}
    ''';
  }
}
