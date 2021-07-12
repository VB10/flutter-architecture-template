import 'package:all_of_template/features/next_page.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BuyView extends StatefulWidget {
  const BuyView({Key? key}) : super(key: key);

  @override
  _BuyViewState createState() => _BuyViewState();
}

class _BuyViewState extends State<BuyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: backHomeModuleButton(),
      appBar: AppBar(
        title: _titleWidget(context),
      ),
      body: Center(
        child: goNextPage(),
      ),
    );
  }

  TextButton goNextPage() {
    return TextButton(
      onPressed: () {
        context.navigateToPage(NextPage());
      },
      child: Text('Go'),
    );
  }

  FloatingActionButton backHomeModuleButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Icon(Icons.arrow_back),
    );
  }

  Text _titleWidget(BuildContext context) {
    return Text(
      'Buy View',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
