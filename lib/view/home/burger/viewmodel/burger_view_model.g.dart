// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burger_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BurgerViewModel on _BurgerViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_BurgerViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLoadingMainAtom = Atom(name: '_BurgerViewModelBase.isLoadingMain');

  @override
  bool get isLoadingMain {
    _$isLoadingMainAtom.reportRead();
    return super.isLoadingMain;
  }

  @override
  set isLoadingMain(bool value) {
    _$isLoadingMainAtom.reportWrite(value, super.isLoadingMain, () {
      super.isLoadingMain = value;
    });
  }

  final _$favoriteBurgerModelAtom =
      Atom(name: '_BurgerViewModelBase.favoriteBurgerModel');

  @override
  List<BurgerModel> get favoriteBurgerModel {
    _$favoriteBurgerModelAtom.reportRead();
    return super.favoriteBurgerModel;
  }

  @override
  set favoriteBurgerModel(List<BurgerModel> value) {
    _$favoriteBurgerModelAtom.reportWrite(value, super.favoriteBurgerModel, () {
      super.favoriteBurgerModel = value;
    });
  }

  final _$mainBurgerModelAtom =
      Atom(name: '_BurgerViewModelBase.mainBurgerModel');

  @override
  List<BurgerModel> get mainBurgerModel {
    _$mainBurgerModelAtom.reportRead();
    return super.mainBurgerModel;
  }

  @override
  set mainBurgerModel(List<BurgerModel> value) {
    _$mainBurgerModelAtom.reportWrite(value, super.mainBurgerModel, () {
      super.mainBurgerModel = value;
    });
  }

  final _$fetchFavoriteAsyncAction =
      AsyncAction('_BurgerViewModelBase.fetchFavorite');

  @override
  Future<void> fetchFavorite() {
    return _$fetchFavoriteAsyncAction.run(() => super.fetchFavorite());
  }

  final _$fetchNormalItemsAsyncAction =
      AsyncAction('_BurgerViewModelBase.fetchNormalItems');

  @override
  Future<void> fetchNormalItems() {
    return _$fetchNormalItemsAsyncAction.run(() => super.fetchNormalItems());
  }

  final _$fetchMinMaxAsyncAction =
      AsyncAction('_BurgerViewModelBase.fetchMinMax');

  @override
  Future<void> fetchMinMax() {
    return _$fetchMinMaxAsyncAction.run(() => super.fetchMinMax());
  }

  final _$_BurgerViewModelBaseActionController =
      ActionController(name: '_BurgerViewModelBase');

  @override
  void _changeLoading() {
    final _$actionInfo = _$_BurgerViewModelBaseActionController.startAction(
        name: '_BurgerViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_BurgerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoadingMain() {
    final _$actionInfo = _$_BurgerViewModelBaseActionController.startAction(
        name: '_BurgerViewModelBase._changeLoadingMain');
    try {
      return super._changeLoadingMain();
    } finally {
      _$_BurgerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoadingMain: ${isLoadingMain},
favoriteBurgerModel: ${favoriteBurgerModel},
mainBurgerModel: ${mainBurgerModel}
    ''';
  }
}
