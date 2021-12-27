import 'package:flutter/material.dart';
import 'package:lib_msaadev/lib_msaadev.dart';
import 'package:marvel_heroes/core/model/character_model.dart';
import 'package:marvel_heroes/core/service/methods/character_methods.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final BuildContext context;
  late final CharacterService _service;

  ScrollController controller = ScrollController();

  @observable
  ObservableList<Character> charactersList = ObservableList<Character>();

  @observable
  bool isLoading = false;

  @observable
  bool moreLoading = false;

  int charactersOffset = 0;

  int characterTotal = 30;

  _HomeViewModelBase({
    required this.context,
  }) {

    _service = CharacterService.instance;
    getCharacters();
  }

  @action
  Future getCharacters() async {
    isLoading = true;
    var characters = await _service.getCharacters(
      offset: charactersOffset,
    );
    isLoading = false;
    if (characters != null) {
      characterTotal = characters.data.total ?? 30;
      charactersList.addAll(characters.data.characters);
    }
  }

  @action
  Future loadMore() async {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      charactersOffset += 30;
      if (charactersOffset < characterTotal) {
        var dif = characterTotal - charactersOffset;
        if (dif < 30) {
          getCharactersMore(limit: dif);
        } else {
          getCharactersMore();
        }
      }
    }
  }

  @action
  Future getCharactersMore({int limit = 30}) async {
    moreLoading = true;

    var characters =
        await _service.getCharacters(offset: charactersOffset, limit: limit);
    moreLoading = false;

    if (characters != null) {
      charactersList.addAll(characters.data.characters);
      controller.animateTo(controller.position.maxScrollExtent + 100,
          duration: 500.millisecondsDuration, curve: Curves.ease);
    }
  }
}
