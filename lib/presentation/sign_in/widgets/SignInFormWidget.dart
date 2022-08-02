import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_with_firebase/application/auth/sign_in_form/SignInFormBloc.dart';
import 'package:flutter_ddd_with_firebase/application/auth/sign_in_form/SignInFormEvent.dart';
import 'package:flutter_ddd_with_firebase/application/auth/sign_in_form/SignInFormState.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOrOption.fold(
          () {},
          (either) => either.fold(
            (f) {
              FlushbarHelper.createError(
                message: f.map(
                  cancelledByUser: (_) => 'Cancelled',
                  serverError: (_) => 'Server error',
                  emailAlreadyInUsed: (_) => 'Email already in use',
                  inValidEmailAndPasswordCombination: (_) =>
                      'Invalid email and password combination',
                ),
              );
            },
            (r) {},
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {
            state.showErrorMessages;
          },
          child: ListView(
            children: [
              const Text(
                "📝",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 130,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
                ),
                autocorrect: false,
                onChanged: (value) => BlocProvider.of<SignInFormBloc>(context)
                    .add(SignInFormEvent.emailChanged(value)),
                validator: (_) => BlocProvider.of<SignInFormBloc>(context)
                    .state
                    .emailAddress
                    .value
                    .fold(
                      (f) => f.maybeMap(
                        invalidEmail: (_) => "Invalid Email",
                        orElse: () => null,
                      ),
                      (r) => null,
                    ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password",
                ),
                autocorrect: false,
                obscureText: true,
                onChanged: (value) => BlocProvider.of<SignInFormBloc>(context)
                    .add(SignInFormEvent.passwordChanged(value)),
                validator: (_) => BlocProvider.of<SignInFormBloc>(context)
                    .state
                    .password
                    .value
                    .fold(
                      (f) => f.maybeMap(
                        shortPassword: (_) => "Invalid Password",
                        orElse: () => null,
                      ),
                      (r) => null,
                    ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        BlocProvider.of<SignInFormBloc>(context).add(
                          const SignInFormEvent
                              .signInWithEmailAndPasswordPressed(),
                        );
                      },
                      child: Text("Sign In".toUpperCase()),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        BlocProvider.of<SignInFormBloc>(context).add(
                          const SignInFormEvent
                              .registerWithEmailAndPasswordPressed(),
                        );
                      },
                      child: Text("Register".toUpperCase()),
                    ),
                  ),
                ],
              ),
              //const SizedBox(height: 8),
              RaisedButton(
                onPressed: () {
                  BlocProvider.of<SignInFormBloc>(context).add(
                    const SignInFormEvent.signInWithGooglePressed(),
                  );
                },
                color: Colors.lightBlue,
                child: Text(
                  "Sign In With Google".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
