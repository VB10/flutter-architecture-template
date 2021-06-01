import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../view/home/burger/model/burger_model.dart';

class BurgerCard extends StatelessWidget {
  final BurgerModel? model;

  const BurgerCard({Key? key, this.model}) : super(key: key);
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
    ));
  }

  RatingBar buildRatingBar() {
    return RatingBar.builder(
      initialRating: (model?.rates ?? 0).toDouble(),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ignoreGestures: true,
      itemSize: 10,
      itemPadding: EdgeInsets.zero,
      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
      onRatingUpdate: (rating) {
        print(rating);
      },
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
