import 'package:freezed_annotation/freezed_annotation.dart';

part 'SignInFormEvent.freezed.dart';

@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String emailStr) = EmailChanged;

  const factory SignInFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;

  const factory SignInFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;

  const factory SignInFormEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;

  const factory SignInFormEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;
}
