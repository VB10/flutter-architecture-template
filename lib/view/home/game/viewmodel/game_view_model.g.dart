// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameViewModel on _GameViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_GameViewModelBase.isLoading', context: context);

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

  late final _$fetchSliderItemsAsyncAction =
      AsyncAction('_GameViewModelBase.fetchSliderItems', context: context);

  @override
  Future<void> fetchSliderItems() {
    return _$fetchSliderItemsAsyncAction.run(() => super.fetchSliderItems());
  }

  late final _$_GameViewModelBaseActionController =
      ActionController(name: '_GameViewModelBase', context: context);

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
