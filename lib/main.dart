import 'package:flutter/material.dart';
import 'package:flutter_starter/store/modules/home/reducer.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_saga/redux_saga.dart';
import 'package:flutter_starter/pages/home/home_page.dart';

import 'models/AppState.dart';

void main() {
  // Create store and apply middleware
  var sagaMiddleware = createSagaMiddleware();

  final store = Store(
    homeReducer,
    initialState: 0,
    middleware: [applyMiddleware(sagaMiddleware)],
  );

  sagaMiddleware.setStore(store);

  sagaMiddleware.run(homeReducer);

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store store;

  MyApp({required this.store}) : super();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Redux Saga Counter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(title: 'Flutter Saga'),
        ));
  }
}
