import 'package:flutter/material.dart';
import '../../../../core/components/list-view/indicator_list_view.dart';

class OnBoardIndcator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const OnBoardIndcator({Key key, this.itemCount, this.currentIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IndactorListView(
      currentIndex: currentIndex,
      itemCount: itemCount,
      onListItem: (index) {
        return FlutterLogo();
      },
    );
  }
}
