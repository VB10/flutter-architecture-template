import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/model/on_board_model.dart';
import 'package:mobx/mobx.dart';
part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) {
    this.context = context;
  }

  void init() {
    onBoarModel = List.generate(5, (index) => OnBoardModel(index.toString()));
  }

  List<OnBoardModel> onBoarModel;

  @observable
  int currentPageIndex = 0;

  @action
  void onPageChanged(int value) {
    currentPageIndex = value;
  }
}
