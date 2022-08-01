
import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/AuthFailure.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/ValueObjects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SignInFormState.freezed.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(""),
        password: Password(""),
        isSubmitting: false,
        showErrorMessages: false,
        authFailureOrSuccessOrOption: none(),
      );

  const factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOrOption,
  }) = _SignInFormState;
}
