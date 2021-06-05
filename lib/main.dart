import 'package:flutter/material.dart';
import 'package:payments/app.dart';
import 'package:profile/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("PSB Application"),
          ),
          body: Container(
            child: Column(
              children: [
                PaymentsScreen(),
                ProfileScreen(),
              ],
            ),
          ),
        ));
  }
}
