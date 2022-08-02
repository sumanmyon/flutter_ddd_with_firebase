import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddd_with_firebase/Injection.dart';
import 'package:flutter_ddd_with_firebase/presentation/core/AppWidget.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureInjection(Environment.prod);
  runApp(const AppWidget());
}

//flutter clean; flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs
