import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/core/Failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class ValueObjects<T> {
  Either<ValueFailure<T>, T> get value;

  const ValueObjects();

  bool isValid() => value.isRight();

  @override
  List<Object> get props => [value];

  @override
  String toString() {
    return 'ValueObjects{value: $value}';
  }
}
