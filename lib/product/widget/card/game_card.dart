import 'package:flutter/material.dart';

import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';

class GameCard extends StatelessWidget {

  const GameCard({Key? key, this.model, this.onPressed}) : super(key: key);
  final GameModel? model;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(child: Image.network(model!.image!)),
            ),
            Text(model!.name!),
            Text('\$ ${model!.money}')
          ],
        ),
      ),
    );
  }
}
