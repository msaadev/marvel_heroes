// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$charactersListAtom = Atom(name: '_HomeViewModelBase.charactersList');

  @override
  ObservableList<Character> get charactersList {
    _$charactersListAtom.reportRead();
    return super.charactersList;
  }

  @override
  set charactersList(ObservableList<Character> value) {
    _$charactersListAtom.reportWrite(value, super.charactersList, () {
      super.charactersList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$moreLoadingAtom = Atom(name: '_HomeViewModelBase.moreLoading');

  @override
  bool get moreLoading {
    _$moreLoadingAtom.reportRead();
    return super.moreLoading;
  }

  @override
  set moreLoading(bool value) {
    _$moreLoadingAtom.reportWrite(value, super.moreLoading, () {
      super.moreLoading = value;
    });
  }

  final _$getCharactersAsyncAction =
      AsyncAction('_HomeViewModelBase.getCharacters');

  @override
  Future<dynamic> getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
  }

  final _$loadMoreAsyncAction = AsyncAction('_HomeViewModelBase.loadMore');

  @override
  Future<dynamic> loadMore() {
    return _$loadMoreAsyncAction.run(() => super.loadMore());
  }

  final _$getCharactersMoreAsyncAction =
      AsyncAction('_HomeViewModelBase.getCharactersMore');

  @override
  Future<dynamic> getCharactersMore({int limit = 30}) {
    return _$getCharactersMoreAsyncAction
        .run(() => super.getCharactersMore(limit: limit));
  }

  @override
  String toString() {
    return '''
charactersList: ${charactersList},
isLoading: ${isLoading},
moreLoading: ${moreLoading}
    ''';
  }
}
