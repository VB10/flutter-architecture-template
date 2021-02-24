part of '../game_view.dart';

extension _GameViewGamesCard on GameView {
  Widget buildColumnNewCard(GameViewModel viewModel) {
    return viewModel.onNewsGameItems().toBuild<List<GameModel>>(
        onSuccess: (data) {
          return Column(
            children: [HeaderButton(titleText: LocaleKeys.home_game_newUpdate), GameGrid(models: data)],
          );
        },
        loaindgWidget: SizedBox(
          height: 200,
          width: 100,
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey[200],
            child: ListTile(
              leading: CircleAvatar(),
              title: Text("data"),
              subtitle: Text("data"),
            ),
          ),
        ),
        notFoundWidget: Text('data'),
        onError: Text('data'));
  }

  Widget buildColumnUpdate(GameViewModel viewModel) {
    return viewModel.onNewsGameItems().toBuild<List<GameModel>>(
        onSuccess: (data) {
          return Column(
            children: [
              HeaderButton(titleText: LocaleKeys.home_game_topDownload),
              GameGrid(
                models: data,
              )
            ],
          );
        },
        loaindgWidget: CircularProgressIndicator(),
        notFoundWidget: Text('data'),
        onError: Text('data'));
  }
}
