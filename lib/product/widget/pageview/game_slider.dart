import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../view/home/game/model/slider_model.dart';

class GameSlider extends StatefulWidget {
  final List<SliderModel> sliderModel;

  const GameSlider({Key key, this.sliderModel}) : super(key: key);

  @override
  _GameSliderState createState() => _GameSliderState();
}

class _GameSliderState extends State<GameSlider> {
  int _selectedValueIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(flex: 10, child: buildPageView()), Expanded(child: buildListViewCirleIndicator())],
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.8),
      onPageChanged: _changeValue,
      itemCount: widget.sliderModel.length,
      itemBuilder: (context, index) => buildCardImage(index),
    );
  }

  void _changeValue(int index) {
    _selectedValueIndex = index;
    setState(() {});
  }

  Widget buildCardImage(int index) => CachedNetworkImage(imageUrl: widget.sliderModel[index].image);

  ListView buildListViewCirleIndicator() {
    return ListView.builder(
      itemCount: widget.sliderModel.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(context.dynamicWidth(0.01)),
        child: CircleAvatar(
          backgroundColor: _selectedValueIndex == index ? context.colorScheme.onError : context.colorScheme.onError.withOpacity(0.1),
          radius: 10,
        ),
      ),
    );
  }
}
