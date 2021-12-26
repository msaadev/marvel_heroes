// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$heroesListAtom = Atom(name: '_HomeViewModelBase.heroesList');

  @override
  ObservableList<dynamic> get heroesList {
    _$heroesListAtom.reportRead();
    return super.heroesList;
  }

  @override
  set heroesList(ObservableList<dynamic> value) {
    _$heroesListAtom.reportWrite(value, super.heroesList, () {
      super.heroesList = value;
    });
  }

  @override
  String toString() {
    return '''
heroesList: ${heroesList}
    ''';
  }
}
