// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burger_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BurgerViewModel on _BurgerViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_BurgerViewModelBase.isLoading', context: context);

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

  late final _$isLoadingMainAtom =
      Atom(name: '_BurgerViewModelBase.isLoadingMain', context: context);

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

  late final _$favoriteBurgerModelAtom =
      Atom(name: '_BurgerViewModelBase.favoriteBurgerModel', context: context);

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

  late final _$mainBurgerModelAtom =
      Atom(name: '_BurgerViewModelBase.mainBurgerModel', context: context);

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

  late final _$fetchFavoriteAsyncAction =
      AsyncAction('_BurgerViewModelBase.fetchFavorite', context: context);

  @override
  Future<void> fetchFavorite() {
    return _$fetchFavoriteAsyncAction.run(() => super.fetchFavorite());
  }

  late final _$fetchNormalItemsAsyncAction =
      AsyncAction('_BurgerViewModelBase.fetchNormalItems', context: context);

  @override
  Future<void> fetchNormalItems() {
    return _$fetchNormalItemsAsyncAction.run(() => super.fetchNormalItems());
  }

  late final _$fetchMinMaxAsyncAction =
      AsyncAction('_BurgerViewModelBase.fetchMinMax', context: context);

  @override
  Future<void> fetchMinMax() {
    return _$fetchMinMaxAsyncAction.run(() => super.fetchMinMax());
  }

  late final _$_BurgerViewModelBaseActionController =
      ActionController(name: '_BurgerViewModelBase', context: context);

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
