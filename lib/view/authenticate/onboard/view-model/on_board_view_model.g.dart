// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_board_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnBoardViewModel on _OnBoardViewModelBase, Store {
  final _$currentPageIndexAtom =
      Atom(name: '_OnBoardViewModelBase.currentPageIndex');

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(value, super.currentPageIndex, () {
      super.currentPageIndex = value;
    });
  }

  final _$_OnBoardViewModelBaseActionController =
      ActionController(name: '_OnBoardViewModelBase');

  @override
  void onPageChanged(int value) {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.onPageChanged');
    try {
      return super.onPageChanged(value);
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex}
    ''';
  }
}
