import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_with_firebase/Injection.dart';
import 'package:flutter_ddd_with_firebase/application/auth/sign_in_form/SignInFormBloc.dart';
import 'package:flutter_ddd_with_firebase/presentation/sign_in/widgets/SignInFormWidget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: const SignInFormWidget(),
      ),
    );
  }
}
