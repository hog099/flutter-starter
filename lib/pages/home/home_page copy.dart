import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_starter/pages/profile/profile_page.dart';

import '../../store/modules/home/actions.dart';

class HomePage extends StatelessWidget {
  HomePage({required this.title}) : super();

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              ),
              child: Text('Go to Profile'),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<dynamic, String>(
              converter: (store) => store.state.toString(),
              builder: (context, count) {
                return new Text(
                  count,
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            ElevatedButton(
              onPressed: () =>
                  StoreProvider.of(context).dispatch(IncrementAction()),
              child: Text('Increase'),
            ),
            ElevatedButton(
              onPressed: () =>
                  StoreProvider.of(context).dispatch(DecrementAction()),
              child: Text('Decrease'),
            ),
            StoreConnector<dynamic, VoidCallback>(
              converter: (store) {
                return () {
                  if (store.state % 2 != 0) {
                    store.dispatch(IncrementAction());
                  }
                };
              },
              builder: (context, callback) {
                return ElevatedButton(
                  onPressed: callback,
                  child: Text('IncreamentIfOdd'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
