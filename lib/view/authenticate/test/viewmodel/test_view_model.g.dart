// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TestViewModel on _TestViewModelBase, Store {
  Computed<bool> _$isEvenComputed;

  @override
  bool get isEven => (_$isEvenComputed ??=
          Computed<bool>(() => super.isEven, name: '_TestViewModelBase.isEven'))
      .value;

  final _$isLoadingAtom = Atom(name: '_TestViewModelBase.isLoading');

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

  final _$numberAtom = Atom(name: '_TestViewModelBase.number');

  @override
  int get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(int value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  final _$getSampleRequestAsyncAction =
      AsyncAction('_TestViewModelBase.getSampleRequest');

  @override
  Future<void> getSampleRequest() {
    return _$getSampleRequestAsyncAction.run(() => super.getSampleRequest());
  }

  final _$_TestViewModelBaseActionController =
      ActionController(name: '_TestViewModelBase');

  @override
  void incrementNumber() {
    final _$actionInfo = _$_TestViewModelBaseActionController.startAction(
        name: '_TestViewModelBase.incrementNumber');
    try {
      return super.incrementNumber();
    } finally {
      _$_TestViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
number: ${number},
isEven: ${isEven}
    ''';
  }
}
