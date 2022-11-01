import 'package:flutter/material.dart';

class IndactorListView extends StatelessWidget {
  const IndactorListView({
    Key? key,
    this.itemCount,
    this.onListItem,
    this.currentIndex,
  }) : super(key: key);
  final int? itemCount;

  final int? currentIndex;

  final Widget Function(int index)? onListItem;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: buildPadding,
    );
  }

  Padding buildPadding(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: buildCircleAvatar(index, context),
    );
  }

  CircleAvatar buildCircleAvatar(int index, BuildContext context) {
    return CircleAvatar(
      backgroundColor: isCurrentIndex(index) ? Colors.black12 : Colors.blue,
      radius: isCurrentIndex(index) ? _pageWidth(context) * 0.03 : _pageWidth(context) * 0.015,
      child: AnimatedOpacity(
        opacity: opacityValue(index),
        duration: const Duration(seconds: 1),
        child: onListItem!(index),
      ),
    );
  }

  double _pageWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double opacityValue(int index) => isCurrentIndex(index) ? 1 : 0;

  bool isCurrentIndex(int index) => currentIndex == index;
}
