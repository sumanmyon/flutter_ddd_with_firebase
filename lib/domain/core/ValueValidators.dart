import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/core/Failures.dart';
import 'package:kt_dart/collection.dart';

class ValueValidators {
  static Either<ValueFailure<String>, String> validateMaxStringLength(
      String input, int maxLength) {
    if (input.length <= maxLength) {
      return right(input);
    } else {
      return left(
        ValueFailure.exceedingLength(failedValue: input, max: maxLength),
      );
    }
  }

  static Either<ValueFailure<String>, String> validateStringNotEmpty(
      String input) {
    if (input.isNotEmpty) {
      return right(input);
    } else {
      return left(
        ValueFailure.empty(failedValue: input),
      );
    }
  }

  static Either<ValueFailure<String>, String> validateSingleLine(String input) {
    if (!input.contains("\n")) {
      return right(input);
    } else {
      return left(
        ValueFailure.multiline(failedValue: input),
      );
    }
  }

  static Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLength<T>(
      KtList<T> input, int maxLength) {
    if (input.size <= maxLength) {
      return right(input);
    } else {
      return left(
        ValueFailure.listTooLong(failedValue: input, max: maxLength),
      );
    }
  }

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
