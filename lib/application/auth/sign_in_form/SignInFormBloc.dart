import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/application/auth/sign_in_form/SignInFormEvent.dart';
import 'package:flutter_ddd_with_firebase/application/auth/sign_in_form/SignInFormState.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/AuthFailure.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/IAuthFacade.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/ValueObjects.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade iAuthFacade;

  SignInFormBloc(this.iAuthFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      await event.map(
        emailChanged: (e) {
          emit(state.copyWith(
            emailAddress: EmailAddress(e.emailStr),
            authFailureOrSuccessOrOption: none(),
          ));
        },
        passwordChanged: (e) {
          emit(state.copyWith(
            password: Password(e.passwordStr),
            authFailureOrSuccessOrOption: none(),
          ));
        },
        registerWithEmailAndPasswordPressed: (e) async {
          //Flutter Firebase & DDD Course [5] – Sign-In Form Logic (Bloc)
          await _performActionOnAuthFacadeEmailAndPassword(
            forwardedCall: iAuthFacade.registerWithEmailAndPassword,
          );
        },
        signInWithEmailAndPasswordPressed: (e) async {
          //Flutter Firebase & DDD Course [5] – Sign-In Form Logic (Bloc)
          await _performActionOnAuthFacadeEmailAndPassword(
            forwardedCall: iAuthFacade.signInWithEmailAndPassword,
          );
        },
        signInWithGooglePressed: (e) async {
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOrOption: none(),
          ));
          final failureOrSuccess = await iAuthFacade.signInWithGoogle();
          emit(state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOrOption: some(failureOrSuccess),
          ));
        },
      );
    });
  }

  Future _performActionOnAuthFacadeEmailAndPassword({
    required Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required Password password,
    })
        forwardedCall,
  }) async {
    Either<AuthFailure, Unit>? failureOrSuccess;
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOrOption: none(),
      ));
      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOrOption: optionOf(failureOrSuccess),
    ));
  }
}
