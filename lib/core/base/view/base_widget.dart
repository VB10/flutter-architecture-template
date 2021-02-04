import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/_product/store/connectivity_store.dart';
import 'package:mobx/mobx.dart';

import '../model/base_view_model.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback onDispose;

  const BaseView({Key key, @required this.viewModel, @required this.onPageBuilder, this.onModelReady, this.onDispose})
      : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  final ConnectivityStore _connectivityStore = ConnectivityStore();
  ReactionDisposer _disposer;

  T model;
  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();

    _disposer = reaction((_) => _connectivityStore.connectivityStream.value, (result) {
      if (result == ConnectivityResult.none) {
        return networkPopUp;
      }
    }, delay: 1000);
  }

  Future get networkPopUp {
    return showDialog<void>(
      context: (model as BaseViewModel).context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('İnternet Bağlantısı'),
          content: Text('Mobil veri veya WiFi kapalı gözüküyor. Lütfen açınız.'),
          actions: [
            FlatButton(
              child: Text('Tamam'),
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
    if (widget.onDispose != null) widget.onDispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
