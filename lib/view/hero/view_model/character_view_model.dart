import 'package:flutter/material.dart';
import 'package:lib_msaadev/lib_msaadev.dart';
import 'package:marvel_heroes/core/model/comic_model.dart';
import 'package:marvel_heroes/core/service/methods/character_methods.dart';
import 'package:mobx/mobx.dart';
part 'character_view_model.g.dart';

class CharacterViewModel = _CharacterViewModelBase with _$CharacterViewModel;

abstract class _CharacterViewModelBase with Store {
  final String characterId;
  final BuildContext context;
  late final CharacterService _service;

  _CharacterViewModelBase(this.context, this.characterId) {
    _service = CharacterService.instance;
    getCharacterDetail();
  }
  @observable
  bool buildDone = false;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Comic> comicList = ObservableList<Comic>();

  @action
  void setBuild(bool done) {
    Future.delayed(500.millisecondsDuration).whenComplete(() {
      buildDone = done;
    });
  }

  @action
  Future getCharacterDetail() async {
    isLoading = true;
    var comics = await _service.getCharacterComic(id: characterId);
    isLoading = false;
    if (comics != null) {
      comicList.addAll(comics.data.comic);
    }
  }
}
