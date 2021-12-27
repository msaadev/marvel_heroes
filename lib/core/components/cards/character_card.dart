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
    required this.character, this.onTap,
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
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   bottom: 0,
          //   child: Transform.rotate(
          //     angle: -pi / 1,
          //     child: Container(
          //         color: Colors.red,
          //         padding: 5.paddingAll,
          //         alignment: Alignment.bottomCenter,
          //         child: Text(
          //           character.name ?? '',
          //           style: context.textTheme.headline6
          //               ?.copyWith(color: Colors.white),
          //         )),
          //   ),
          // )
        ],
      ),
    ).onTap(onTap);
  }
}
