import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_ddd_with_firebase/presentation/sign_in/SignInPage.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ddd_with_firebase/presentation/splash/SplashPage.dart';

part 'Routes.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage),
  ],
)
class Routes extends _$Routes {
}


