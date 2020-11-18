// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'associated.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AssociatedController on AssociatedControllerBase, Store {
  final _$idCtrlAtom = Atom(name: 'AssociatedControllerBase.idCtrl');

  @override
  TextEditingController get idCtrl {
    _$idCtrlAtom.reportRead();
    return super.idCtrl;
  }

  @override
  set idCtrl(TextEditingController value) {
    _$idCtrlAtom.reportWrite(value, super.idCtrl, () {
      super.idCtrl = value;
    });
  }

  final _$nameCtrlAtom = Atom(name: 'AssociatedControllerBase.nameCtrl');

  @override
  TextEditingController get nameCtrl {
    _$nameCtrlAtom.reportRead();
    return super.nameCtrl;
  }

  @override
  set nameCtrl(TextEditingController value) {
    _$nameCtrlAtom.reportWrite(value, super.nameCtrl, () {
      super.nameCtrl = value;
    });
  }

  final _$laodTextControllersAsyncAction =
      AsyncAction('AssociatedControllerBase.laodTextControllers');

  @override
  Future setTextControllers() {
    return _$laodTextControllersAsyncAction
        .run(() => super.setTextControllers());
  }

  @override
  String toString() {
    return '''
idCtrl: ${idCtrl},
nameCtrl: ${nameCtrl}
    ''';
  }
}
