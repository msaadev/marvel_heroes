import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_heroes/core/service/methods/character_methods.dart';

void main() {
  late final CharacterService _characterService;

  setUp(() {
    _characterService = CharacterService.instance;
  });

  test('charaters', () async {
    var response = await _characterService.getCharacters(offset: 0);
    expect(isNotNull, response?.data.characters[0].name);
  });

  test('comics', () async {
    var response = await _characterService.getCharacterComic(id: '1011054');
    expect(isNotNull, response?.data.comic[0].description);
  });
}
