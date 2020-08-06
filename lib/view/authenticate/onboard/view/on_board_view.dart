import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/components/column/form_column.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/view/_widgets/listview/on_board_indicator.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/view-model/on_board_view_model.dart';

class OnBoardView extends StatefulWidget {
  @override
  _OnBoardViewState createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  OnBoardViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel value) => Scaffold(
        body: buildColumnBody(),
      ),
    );
  }

  Column buildColumnBody() {
    return Column(
      children: <Widget>[Expanded(flex: 9, child: buildPageView()), Expanded(child: buildObserverIndcator())],
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      onPageChanged: (value) {
        viewModel.onPageChanged(value);
      },
      itemCount: viewModel.onBoarModel.length,
      itemBuilder: (context, index) => Container(
        color: context.randomColor,
        child: FormColumn(
          children: <Widget>[Placeholder(), Text(viewModel.onBoarModel[index].text)],
        ),
      ),
    );
  }

  Observer buildObserverIndcator() {
    return Observer(builder: (_) {
      return OnBoardIndcator(
        itemCount: viewModel.onBoarModel.length,
        currentIndex: viewModel.currentPageIndex,
      );
    });
  }
}
