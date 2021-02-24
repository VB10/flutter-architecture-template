import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../../../view/home/game/model/game_model.dart';

class GameCard extends StatelessWidget {
  final GameModel model;
  final VoidCallback onPressed;

  const GameCard({Key key, this.model, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(child: Image.network(model.image)),
            ),
            Text(model.name),
            Text('\$ ${model.money}')
          ],
        ),
      ),
    );
  }
}
