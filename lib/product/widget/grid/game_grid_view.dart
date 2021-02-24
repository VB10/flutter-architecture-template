import 'package:flutter/material.dart';

import '../../../view/home/game/model/game_model.dart';
import '../card/game_card.dart';

class GameGrid extends StatelessWidget {
  final List<GameModel> models;
  final void Function(GameModel item, int indx) onPressed;

  const GameGrid({Key key, this.models, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
      ),
      itemCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => GameCard(
        model: models[index],
        onPressed: () {
          onPressed(models[index], index);
        },
      ),
    );
  }
}
