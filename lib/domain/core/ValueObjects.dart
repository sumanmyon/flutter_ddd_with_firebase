import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/core/Errors.dart';
import 'package:flutter_ddd_with_firebase/domain/core/Failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObjects<T> {
  Either<ValueFailure<T>, T> get value;

  const ValueObjects();

  bool isValid() => value.isRight();

  Either<ValueFailure<dynamic>, Unit> get fauilureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
    //return value.fold((f) => throw UnexpectedValueError(f), (s) => s);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() {
    return 'ValueObjects{value: $value}';
  }
}

class UniqueId extends ValueObjects<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(
      right(const Uuid().v1()),
    );
  }

  factory UniqueId.fromUniqueString(String? uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(
      right(uniqueId!),
    );
  }

  const UniqueId._(this.value);
}
