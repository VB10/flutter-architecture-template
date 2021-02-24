// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameViewModel on _GameViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_GameViewModelBase.isLoading');

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

  final _$fetchSliderItemsAsyncAction =
      AsyncAction('_GameViewModelBase.fetchSliderItems');

  @override
  Future<void> fetchSliderItems() {
    return _$fetchSliderItemsAsyncAction.run(() => super.fetchSliderItems());
  }

  final _$_GameViewModelBaseActionController =
      ActionController(name: '_GameViewModelBase');

  @override
  void changeLoading() {
    final _$actionInfo = _$_GameViewModelBaseActionController.startAction(
        name: '_GameViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_GameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
