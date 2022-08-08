import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/core/Failures.dart';
import 'package:flutter_ddd_with_firebase/domain/core/ValueObjects.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/ValueObjects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ToDoItem.freezed.dart';

@freezed
abstract class ToDoItem with _$ToDoItem {
  const ToDoItem._();

  const factory ToDoItem({
    required UniqueId id,
    required TodoName name,
    required bool done,
  }) = _ToDoItem;

  factory ToDoItem.empty() => ToDoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.value.fold(
      (l) => some(l),
      (r) => none(),
    );
  }
}
