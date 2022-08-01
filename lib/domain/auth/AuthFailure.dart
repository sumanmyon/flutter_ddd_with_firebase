import 'package:freezed_annotation/freezed_annotation.dart';

part 'AuthFailure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure{
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUsed() = SmailAlreadyInUsed;
  const factory AuthFailure.inValidEmailAndPasswordCombination() = InValidEmailAndPasswordCombination;
}