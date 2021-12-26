import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  Future<Response> getCharacters({
    int offset = 0,
  }) async {
    var a = await _networkManager.get<String>(path: 'characters', query: {'limit': 3, 'offset': offset});
    debugPrint('samil ${a.data}');
    return a;
  }

}
