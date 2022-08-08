import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/core/Failures.dart';
import 'package:flutter_ddd_with_firebase/domain/core/ValueObjects.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/ToDoItem.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/ValueObjects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'Note.freezed.dart';

@freezed
abstract class Note implements _$Note {
  const Note._();

  const factory Note({
    required UniqueId id,
    required NoteBody body,
    required NoteColor color,
    required List3<ToDoItem> todos,
  }) = _Note;

  factory Note.empty() => Note(
        id: UniqueId(),
        body: NoteBody(""),
        color: NoteColor(NoteColor.PREDEFINED_COLORS[0]),
        todos: List3(emptyList()),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return body.fauilureOrUnit
        .andThen(todos.fauilureOrUnit)
        .andThen(
          todos
              .getOrCrash()
              .map((todoItem) => todoItem.failureOption)
              .filter((o) => o.isSome())
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), (f) => left(f)),
        )
        .fold(
          (l) => some(l),
          (r) => none(),
        );
  }
}
