import 'package:bloc/bloc.dart';
import 'package:flutter_ddd_with_firebase/application/auth/sign_in_form/SignInFormEvent.dart';
import 'package:flutter_ddd_with_firebase/application/auth/sign_in_form/SignInFormState.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/IAuthFacade.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade iAuthFacade;

  SignInFormBloc(this.iAuthFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
