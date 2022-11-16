import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  Expanded(flex: 9, child: Container(color: Colors.red, child: const FlutterLogo(size: 200))),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, bottom: 5),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          Tab(
                            text: '   Login   ',
                          ),
                          Tab(icon: Icon(Icons.radio)),
                        ],
                      ),
                    ),
                  ),
                  // Spacer(flex: 12)
                ],
              ),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.4,
              child: Center(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextField(),
                        TextField(),
                        ElevatedButton(
                          onPressed: null,
                          child: Text(''),
                        ),
                        ElevatedButton(
                          onPressed: null,
                          child: Text(''),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
