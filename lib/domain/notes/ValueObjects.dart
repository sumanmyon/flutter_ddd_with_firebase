import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/core/Failures.dart';
import 'package:flutter_ddd_with_firebase/domain/core/ValueObjects.dart';
import 'package:flutter_ddd_with_firebase/domain/core/ValueTransformers.dart';
import 'package:flutter_ddd_with_firebase/domain/core/ValueValidators.dart';
import 'package:kt_dart/collection.dart';

class NoteBody extends ValueObjects<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const int MAX_LENGTH = 1000;

  factory NoteBody(String input) {
    assert(input != null);
    return NoteBody._(
      ValueValidators.validateMaxStringLength(input, MAX_LENGTH).flatMap(
        ValueValidators.validateStringNotEmpty,
      ),
    );
    // return NoteBody._(
    //   ValueValidators.validateMaxStringLength(input, MAX_LENGTH).flatMap(
    //     (valueFromPrevFun) =>
    //         ValueValidators.validateStringNotEmpty(valueFromPrevFun),
    //   ),
    // );
  }

  const NoteBody._(this.value);
}

class TodoName extends ValueObjects<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const int MAX_LENGTH = 30;

  factory TodoName(String input) {
    assert(input != null);
    return TodoName._(
      ValueValidators.validateMaxStringLength(input, MAX_LENGTH).flatMap(
        ValueValidators.validateSingleLine,
      ),
    );
  }

  const TodoName._(this.value);
}

class NoteColor extends ValueObjects<Color> {
  @override
  final Either<ValueFailure<Color>, Color> value;

  static const List<Color> PREDEFINED_COLORS = [
    Color(0xfffafafa), // canvas
    Color(0xfffa8072), // salmon
    Color(0xfffedc56), // mustard
    Color(0xffd0f0c0), // tea
    Color(0xfffca3b7), // flamingo
    Color(0xff997950), // tortilla
    Color(0xfffffdd0), // cream
  ];

  factory NoteColor(Color input) {
    assert(input != null);
    return NoteColor._(
      right(ValueTransformers.makeColorOpaque(input)),
    );
  }

  const NoteColor._(this.value);
}

class List3<T> extends ValueObjects<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const int MAX_LENGTH = 3;

  factory List3(KtList<T> input) {
    assert(input != null);
    return List3._(
      ValueValidators.validateMaxListLength(input, MAX_LENGTH),
    );
  }

  const List3._(this.value);

  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  bool get isFull {
    return length == MAX_LENGTH;
  }
}
