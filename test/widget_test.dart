import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes/core/service/methods/character_methods.dart';
import 'package:marvel_heroes/core/service/network_manager.dart';

void main() {
  late final CharacterService _characterService;

  setUp(() {
    _characterService = CharacterService.instance;
  });

  test('charaters', () async {
    var response = await _characterService.getCharacters(offset: 5);
    expect(200, response.statusCode);
  });
}
