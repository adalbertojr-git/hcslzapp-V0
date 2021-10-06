// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemModel on ItemModelBase, Store {
  final _$nameAtom = Atom(name: 'ItemModelBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$checkAtom = Atom(name: 'ItemModelBase.check');

  @override
  bool get check {
    _$checkAtom.reportRead();
    return super.check;
  }

  @override
  set check(bool value) {
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
name: ${name},
check: ${check}
    ''';
  }
}
