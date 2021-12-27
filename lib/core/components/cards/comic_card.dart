import 'package:flutter/material.dart';
import 'package:lib_msaadev/lib_msaadev.dart';
import '../image/loader_image.dart';
import '../../model/comic_model.dart';

class ComicCard extends StatelessWidget {
  final Comic comic;
  const ComicCard({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 5.paddingAll,
      height: context.height / 3,
      width: context.width / 2.5,
      child: LoaderImage(
          link: '${comic.thumbnail?.path}.${comic.thumbnail?.extension}',
          name: UniqueKey().toString()),
    );
  }
}
