import 'package:flutter/material.dart';
import 'package:flutter_ddd_with_firebase/Injection.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Container(
        child: Text("hello world"),
      ),
    );
  }
}

//flutter clean; flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs
