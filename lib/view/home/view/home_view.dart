import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lib_msaadev/lib_msaadev.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/components/cards/character_card.dart';
import '../../../core/model/character_model.dart';
import '../../hero/view/character_view.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(context: context),
      onModelReady: (viewModel) {
        viewModel.controller.addListener(viewModel.loadMore);
      },
      onDispose: (viewModel) {
        viewModel.controller.dispose();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          body: Observer(builder: (_) {
            return Stack(
              fit: StackFit.expand,
              children: [
                AnimatedSwitcher(
                  duration: 500.millisecondsDuration,
                  child: !viewModel.isLoading
                      ? buildCharacterGrid(viewModel)
                      : loader,
                ),
                buildLoadMore(viewModel)
              ],
            );
          }),
        );
      },
    );
  }

  GridView buildCharacterGrid(HomeViewModel viewModel) {
    return GridView.builder(
      controller: viewModel.controller,
      padding: 0.paddingAll,
      itemCount: viewModel.charactersList.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        Character character = viewModel.charactersList[index];
        return CharacterCard(
          character: character,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CharacterView(character: character)));
          },
        );
      },
    );
  }

  AnimatedSwitcher buildLoadMore(HomeViewModel viewModel) {
    return AnimatedSwitcher(
      duration: 200.millisecondsDuration,
      child: viewModel.moreLoading
          ? Container(
              color: Colors.black.withOpacity(.3),
              child: const Center(child: CircularProgressIndicator()),
            )
          : 0.hSized,
    );
  }

  Container get loader {
    return Container(
      color: Colors.black,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
