// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharacterViewModel on _CharacterViewModelBase, Store {
  final _$buildDoneAtom = Atom(name: '_CharacterViewModelBase.buildDone');

  @override
  bool get buildDone {
    _$buildDoneAtom.reportRead();
    return super.buildDone;
  }

  @override
  set buildDone(bool value) {
    _$buildDoneAtom.reportWrite(value, super.buildDone, () {
      super.buildDone = value;
    });
  }

  final _$_CharacterViewModelBaseActionController =
      ActionController(name: '_CharacterViewModelBase');

  @override
  void setBuild(bool done) {
    final _$actionInfo = _$_CharacterViewModelBaseActionController.startAction(
        name: '_CharacterViewModelBase.setBuild');
    try {
      return super.setBuild(done);
    } finally {
      _$_CharacterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buildDone: ${buildDone}
    ''';
  }
}
