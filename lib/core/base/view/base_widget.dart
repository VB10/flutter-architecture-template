import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/view/_product/store/connectivity_store.dart';
import 'package:mobx/mobx.dart';

import '../model/base_view_model.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback? onDispose;

  const BaseView(
      {Key? key, required this.viewModel, required this.onPageBuilder, required this.onModelReady, this.onDispose})
      : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T model;

  final ConnectivityStore _connectivityStore = ConnectivityStore();

  late final ReactionDisposer _disposer;

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();

    _disposer = reaction((_) => _connectivityStore.connectivityStream.value, (result) {
      if (result == ConnectivityResult.none) {
        networkPopUp;
      }
    }, delay: 1000);
  }

  Future get networkPopUp {
    var currentContext = (model as BaseViewModel).context;
    return showDialog(
      context: (currentContext)!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(LocaleKeys.networkCheck_networkConnectionText.locale),
          content: Text(LocaleKeys.networkCheck_networkStatusClosedText.locale),
          actions: [
            TextButton(
              child: Text(LocaleKeys.networkCheck_networkActionText.locale),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
