import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/core/Failures.dart';

class ValueValidators {
  static Either<ValueFailure<String>, String> validateEmailAddress(
      String input) {
    // Maybe not the most robust way of email validation but it's good enough
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

    if (RegExp(emailRegex).hasMatch(input)) {
      return right(input);
    } else {
      return left(ValueFailure.invalidEmail(failedValue: input));
    }
  }

  static Either<ValueFailure<String>, String> validatePassword(String input) {
    if (input.length >= 6) {
      return right(input);
    } else {
      return left(ValueFailure.shortPassword(failedValue: input));
    }
  }
}
