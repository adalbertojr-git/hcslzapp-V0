// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formerror.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormErrorController on FormErrorControllerBase, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: 'FormErrorControllerBase.hasErrors'))
          .value;
  Computed<dynamic> _$isValidComputed;

  @override
  dynamic get isValid =>
      (_$isValidComputed ??= Computed<dynamic>(() => super.isValid,
              name: 'FormErrorControllerBase.isValid'))
          .value;

  final _$nameAtom = Atom(name: 'FormErrorControllerBase.name');

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

  final _$FormErrorControllerBaseActionController =
      ActionController(name: 'FormErrorControllerBase');

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$FormErrorControllerBaseActionController.startAction(
        name: 'FormErrorControllerBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$FormErrorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
hasErrors: ${hasErrors},
isValid: ${isValid}
    ''';
  }
}
