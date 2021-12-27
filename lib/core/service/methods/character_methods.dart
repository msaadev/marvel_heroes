import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marvel_heroes/core/model/character_model.dart';
import 'package:marvel_heroes/core/model/comic_model.dart';
import 'package:marvel_heroes/core/service/network_manager.dart';

class CharacterService {
  static CharacterService? _instance;

  static CharacterService get instance {
    _instance ??= CharacterService._init();
    return _instance!;
  }

  late final NetworkManager _networkManager;

  CharacterService._init() {
    _networkManager = NetworkManager.instance;
  }

  Future<CharacterModel?> getCharacters({
    int offset = 0,
    int limit = 30,
  }) async {
    var request = await _networkManager
        .get(path: 'characters', query: {'limit': limit, 'offset': offset});
    if (request.statusCode == 200) {
      var data = CharacterModel.fromJson(request.data);
      return data;
    }
    return null;
  }

  Future<ComicModel?> getCharacterComic({
    required String id,
  }) async {
    var request =
        await _networkManager.get(path: 'characters/$id/comics', query: {
      'startYear':2005,
      'orderBy': 'onsaleDate', 'limit': 10
    });
    if (request.statusCode == 200) {      
      var data = ComicModel.fromJson(request.data);
      return data;
    }
    return null;
  }
}
