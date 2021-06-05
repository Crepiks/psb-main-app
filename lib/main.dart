import 'package:flutter/material.dart';
import "package:micro_mobile/micro_mobile.dart";
import "package:payments/app.dart";
import "package:profile/app.dart";

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final Store store = Store();

  App() {
    store.registerEvent('TRANSACTION_ADD');
    store.registerEvent('NAVIGATE_HOME');
    store.registerEvent('NAVIGATE_PROFILE');
    store.registerEvent('NAVIGATE_PAYMENTS');
    store.registerEvent('NAVIGATE_POP');

    store.addEventListener('TRANSACTION_ADD', (Object payload) {
      print('TRANSACTION_ADD');
    });

    store.addEventListener('NAVIGATE_HOME', () {
      print('NAVIGATE_HOME');
    });

    store.addEventListener('NAVIGATE_PROFILE', () {
      print('NAVIGATE_PROFILE');
    });

    store.addEventListener('NAVIGATE_PAYMENTS', () {
      print('NAVIGATE_PAYMENTS');
    });

    store.addEventListener('NAVIGATE_POP', () {
      print('NAVIGATE_POP');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ПСБ Банк',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Screen(
        store: store,
      ),
    );
  }
}

class Screen extends StatelessWidget {
  final Store store;

  Screen({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    store.addEventListener('NAVIGATE_PROFILE', () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProfileScreen(store: store)));
    });

    store.addEventListener('NAVIGATE_PAYMENTS', () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PaymentsScreen(store: store)));
    });

    store.addEventListener('NAVIGATE_POP', () {
      Navigator.pop(context);
    });

    return PaymentsScreen(
      store: store,
    );
  }
}
