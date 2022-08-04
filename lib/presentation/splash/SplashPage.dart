import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_with_firebase/application/auth/AuthBloc.dart';
import 'package:flutter_ddd_with_firebase/application/auth/AuthState.dart';
import 'package:flutter_ddd_with_firebase/presentation/routes/Routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            try {
              print("I am authenticated");
            } catch (e, s) {
              print(s);
            }
          },
          unauthenticated: (_) {
            context.router.popAndPush(const SignInRoute());
          },
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
