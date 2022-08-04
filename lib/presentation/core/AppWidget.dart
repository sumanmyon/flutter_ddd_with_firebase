import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_with_firebase/Injection.dart';
import 'package:flutter_ddd_with_firebase/application/auth/AuthBloc.dart';
import 'package:flutter_ddd_with_firebase/application/auth/AuthEvent.dart';
import 'package:flutter_ddd_with_firebase/presentation/routes/Routes.dart';
import 'package:flutter_ddd_with_firebase/presentation/sign_in/SignInPage.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        ),
      ],
      child: MaterialApp(
        title: 'Notes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.green,
          accentColor: Colors.blueAccent,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        builder: (_, __) {
          var routes = Routes();
          return MaterialApp.router(
            routerDelegate: AutoRouterDelegate(routes),
            routeInformationParser: routes.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
