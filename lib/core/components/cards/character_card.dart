import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lib_msaadev/lib_msaadev.dart';
import 'package:marvel_heroes/core/components/image/loader_image.dart';
import 'package:marvel_heroes/core/constants/app_constants.dart';
import 'package:marvel_heroes/core/model/character_model.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final Function()? onTap;
  const CharacterCard({
    Key? key,
    required this.character,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: 10.customRadius,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          LoaderImage(
              name: character.name ?? '',
              width: double.infinity,
              link:
                  '${character.thumbnail?.path}.${character.thumbnail?.extension}'),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: 5.paddingAll,
              color: Colors.black.withOpacity(.3),
              alignment: Alignment.center,
              child: Text(
                character.name ?? '',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyText1?.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    ).onTap(onTap);
  }
}
