// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on DashboardControllerBase, Store {
  final _$associatedIdAtom = Atom(name: 'DashboardControllerBase.associatedId');

  @override
  int get associatedId {
    _$associatedIdAtom.reportRead();
    return super.associatedId;
  }

  @override
  set associatedId(int value) {
    _$associatedIdAtom.reportWrite(value, super.associatedId, () {
      super.associatedId = value;
    });
  }

  final _$photoAtom = Atom(name: 'DashboardControllerBase.photo');

  @override
  Uint8List get photo {
    _$photoAtom.reportRead();
    return super.photo;
  }

  @override
  set photo(Uint8List value) {
    _$photoAtom.reportWrite(value, super.photo, () {
      super.photo = value;
    });
  }

  final _$errorMsgAtom = Atom(name: 'DashboardControllerBase.errorMsg');

  @override
  String get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  @override
  String toString() {
    return '''
associatedId: ${associatedId},
photo: ${photo},
errorMsg: ${errorMsg}
    ''';
  }
}
