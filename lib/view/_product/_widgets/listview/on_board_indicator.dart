import 'package:architecture_widgets/src/list-view/indicator_list_view.dart';
import 'package:flutter/material.dart';

class OnBoardIndcator extends StatelessWidget {
  const OnBoardIndcator({Key? key, this.itemCount, this.currentIndex}) : super(key: key);
  final int? itemCount;
  final int? currentIndex;
  @override
  Widget build(BuildContext context) {
    return IndactorListView(
      currentIndex: currentIndex,
      itemCount: itemCount,
      onListItem: (index) {
        return const FlutterLogo();
      },
    );
  }
}
