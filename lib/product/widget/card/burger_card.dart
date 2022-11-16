import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:fluttermvvmtemplate/view/home/burger/model/burger_model.dart';

class BurgerCard extends StatelessWidget {
  const BurgerCard({Key? key, this.model}) : super(key: key);
  final BurgerModel? model;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(child: Image.network(model?.image ?? '')),
          Text('${model?.name}'),
          buildRatingBar(),
          Text('${model?.price} \$'),
        ],
      ),
    );
  }

  RatingBar buildRatingBar() {
    return RatingBar.builder(
      initialRating: (model?.rates ?? 0).toDouble(),
      minRating: 1,
      allowHalfRating: true,
      ignoreGestures: true,
      itemSize: 10,
      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
      onRatingUpdate: print,
    );
  }
}

extension BurgerCardExtension on BurgerCard {
  Widget buildList(List<BurgerModel> items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((e) => BurgerCard(model: e)).toList(),
      ),
    );
  }
}
