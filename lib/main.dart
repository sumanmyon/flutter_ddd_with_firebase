import 'package:flutter/material.dart';

void main() {
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

Future<void> signIn({
  required String email,
  required String password,
}) async{

}

//flutter clean; flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs
