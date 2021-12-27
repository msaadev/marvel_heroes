import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lib_msaadev/lib_msaadev.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/components/cards/comic_card.dart';
import '../../../core/components/image/loader_image.dart';
import '../../../core/model/character_model.dart';
import '../../../core/model/comic_model.dart';
import '../view_model/character_view_model.dart';

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
              buildImage(),
              Observer(builder: (_) {
                return AnimatedContainer(
                  duration: 500.millisecondsDuration,
                  color: viewModel.buildDone
                      ? Colors.black.withOpacity(.6)
                      : Colors.transparent,
                );
              }),
              SafeArea(
                child: Observer(
                  builder: (context) => AnimatedSwitcher(
                    duration: 1.secondDuration,
                    child: viewModel.buildDone
                        ? Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildBackIcon(context),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      buildTitle(),
                                      50.hSized,
                                      buildDescription(context)
                                    ],
                                  ),
                                ),
                                Expanded(child: 0.hSized),
                                SizedBox(
                                  height: context.height / 3,
                                  child: buildComics(viewModel),
                                )
                              ],
                            ),
                          )
                        : 0.hSized,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  LoaderImage buildImage() {
    return LoaderImage(
        name: character.name ?? '',
        width: double.infinity,
        link: '${character.thumbnail?.path}.${character.thumbnail?.extension}');
  }

  IconButton buildBackIcon(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: Colors.white,
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 30,
        ));
  }

  AutoSizeText buildTitle() {
    return AutoSizeText(
      character.name ?? '',
      style: const TextStyle(fontSize: 30, color: Colors.white),
      minFontSize: 10,
      stepGranularity: 10,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text buildDescription(BuildContext context) {
    return Text(
      character.description ?? '',
      style: context.textTheme.bodyText1?.copyWith(color: Colors.white),
    );
  }

  AnimatedSwitcher buildComics(CharacterViewModel viewModel) {
    return AnimatedSwitcher(
      duration: 500.millisecondsDuration,
      child: viewModel.isComicListNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.comicList.length,
              itemBuilder: (context, index) {
                Comic comic = viewModel.comicList[index];
                return ComicCard(comic: comic);
              },
            )
          : 0.hSized,
    );
  }
}
