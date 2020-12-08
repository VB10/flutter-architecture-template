import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/components/text/auto_locale_text.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../_product/_widgets/avatar/on_board_circle.dart';
import '../model/on_board_model.dart';
import '../viewModel/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) =>
          Scaffold(
        body: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              Spacer(flex: 1),
              Expanded(flex: 5, child: buildPageView(viewModel)),
              Expanded(flex: 2, child: buildRowFooter(viewModel, context)),
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
        itemCount: viewModel.onBoardItems.length,
        onPageChanged: (value) {
          viewModel.changeCurrentIndex(value);
        },
        itemBuilder: (context, index) =>
            buildColumnBody(context, viewModel.onBoardItems[index]));
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildListViewCircles(viewModel),
        Expanded(child: Center(child: Observer(builder: (_) {
          return Visibility(
              visible: viewModel.isLoading, child: CircularProgressIndicator());
        }))),
        buildFloatingActionButtonSkip(context, viewModel)
      ],
    );
  }

  ListView buildListViewCircles(OnBoardViewModel viewModel) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Observer(builder: (_) {
          return OnBoardCircle(
            isSelected: viewModel.currentIndex == index,
          );
        });
      },
    );
  }

  FloatingActionButton buildFloatingActionButtonSkip(
      BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
      backgroundColor: context.colors.secondaryVariant,
      child: Icon(
        Icons.keyboard_arrow_right,
        color: context.colors.primaryVariant,
      ),
      onPressed: () => viewModel.completeToOnBoard(),
    );
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(model.imagePath)),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        buildAutoLocaleTextTitle(model, context),
        Padding(
            padding: context.paddingMediumHorizontal,
            child: buildAutoLocaleTextDescription(model, context))
      ],
    );
  }

  AutoLocaleText buildAutoLocaleTextTitle(
      OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.title,
      style: Theme.of(context).textTheme.headline3.copyWith(
          fontWeight: FontWeight.bold, color: context.colors.onSecondary),
    );
  }

  AutoLocaleText buildAutoLocaleTextDescription(
      OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.description,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.subtitle1.copyWith(
            fontWeight: FontWeight.w100,
          ),
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}
