import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/view/_product/_utilty/burger_network_enum.dart';
import 'package:fluttermvvmtemplate/view/home/burger/model/burger_model.dart';
import 'package:fluttermvvmtemplate/view/home/burger/service/burger_serivce.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';

part 'burger_view_model.g.dart';

class BurgerViewModel = _BurgerViewModelBase with _$BurgerViewModel;

abstract class _BurgerViewModelBase with Store, BaseViewModel {
  _BurgerViewModelBase(this.burgerService);
  final IBurgerService burgerService;

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingMain = false;
  @observable
  List<BurgerModel> favoriteBurgerModel = [];
  @observable
  List<BurgerModel> mainBurgerModel = [];
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  RangeValues? _values;

  bool _isAscending = true;
  @override
  void init() {
    fetchFavorite();
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void _changeLoadingMain() {
    isLoadingMain = !isLoadingMain;
  }

  @action
  Future<void> fetchFavorite() async {
    _changeLoading();
    favoriteBurgerModel = await burgerService.fetchFavoriteBurgers();
    _changeLoading();
  }

  @action
  Future<void> fetchNormalItems() async {
    if (mainBurgerModel.isNotEmpty) return;
    _changeLoadingMain();
    mainBurgerModel = await burgerService.fetchBurgersSorted(sort: BurgerSortValues.RATES);
    _changeLoadingMain();
  }

  void changeRangeValues(RangeValues values) {
    _values = values;
  }

  void changeAscending(bool value) {
    _isAscending = value;
  }

  @action
  Future<void> fetchMinMax() async {
    viewModelContext.navigation.pop();
    _changeLoadingMain();
    mainBurgerModel = await burgerService.fetchBurgersLimited(max: _values?.end, min: _values?.start);
    _changeLoadingMain();
  }

  Future<void> fetchSort(BurgerSortValues value) async {
    viewModelContext.navigation.pop();
    _changeLoadingMain();
    mainBurgerModel = await burgerService.fetchBurgersSorted(
      sort: value,
      types: _isAscending ? BurgerSortValuesType.ASC : BurgerSortValuesType.DSC,
    );
    _changeLoadingMain();
  }
}
