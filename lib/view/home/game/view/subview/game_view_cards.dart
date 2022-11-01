part of '../game_view.dart';

extension _GameViewGamesCard on GameView {
  Widget buildColumnNewCard(GameViewModel viewModel) {
    return viewModel.onNewsGameItems().toBuild<List<GameModel>?>(
        onSuccess: (data) {
          return Column(
            children: [const HeaderButton(titleText: LocaleKeys.home_game_newUpdate), GameGrid(models: data)],
          );
        },
        loadingWidget: SizedBox(
          height: 200,
          width: 100,
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey[200]!,
            child: const ListTile(
              leading: CircleAvatar(),
              title: Text('data'),
              subtitle: Text('data'),
            ),
          ),
        ),
        notFoundWidget: const Text('data'),
        onError: const Text('data'),);
  }

  Widget buildColumnUpdate(GameViewModel viewModel) {
    return viewModel.onNewsGameItems().toBuild<List<GameModel>?>(
        onSuccess: (data) {
          return Column(
            children: [
              const HeaderButton(titleText: LocaleKeys.home_game_topDownload),
              GameGrid(
                models: data,
              )
            ],
          );
        },
        loadingWidget: const CircularProgressIndicator(),
        notFoundWidget: const Text('data'),
        onError: const Text('data'),);
  }
}
