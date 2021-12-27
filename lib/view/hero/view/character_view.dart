import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lib_msaadev/lib_msaadev.dart';
import 'package:marvel_heroes/core/base/view/base_view.dart';
import 'package:marvel_heroes/core/components/cards/comic_card.dart';
import 'package:marvel_heroes/core/components/image/loader_image.dart';
import 'package:marvel_heroes/core/model/character_model.dart';
import 'package:marvel_heroes/core/model/comic_model.dart';
import 'package:marvel_heroes/view/hero/view_model/character_view_model.dart';

class CharacterView extends StatelessWidget {
  final Character character;

  const CharacterView({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<CharacterViewModel>(
        onModelReady: (model) {
          model.setBuild(true);
        },
        viewModel: CharacterViewModel(context, character.id.toString()),
        onPageBuilder: (context, viewModel) {
          return Stack(
            fit: StackFit.expand,
            children: [
              LoaderImage(
                  name: character.name ?? '',
                  width: double.infinity,
                  link:
                      '${character.thumbnail?.path}.${character.thumbnail?.extension}'),
              Observer(builder: (_) {
                return AnimatedContainer(
                  duration: 500.millisecondsDuration,
                  color: viewModel.buildDone
                      ? Colors.black.withOpacity(.6)
                      : Colors.transparent,
                );
              }),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SafeArea(
                    child: Observer(
                      builder: (context) => AnimatedSwitcher(
                        duration: 1.secondDuration,
                        child: viewModel.buildDone
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        color: Colors.white,
                                        icon: const Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          size: 30,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            character.name ?? '',
                                            style: const TextStyle(
                                                fontSize: 30,
                                                color: Colors.white),
                                            minFontSize: 10,
                                            stepGranularity: 10,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          50.hSized,
                                          Text(
                                            character.description ?? '',
                                            style: context.textTheme.bodyText1
                                                ?.copyWith(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(child: 0.hSized),
                                    SizedBox(
                                      height: context.height / 3,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: viewModel.comicList.length,
                                        itemBuilder: (context, index) {
                                          Comic comic =
                                              viewModel.comicList[index];
                                          return ComicCard(comic: comic);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : 0.hSized,
                      ),
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}
