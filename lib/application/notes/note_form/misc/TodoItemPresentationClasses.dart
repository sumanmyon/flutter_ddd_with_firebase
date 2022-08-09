import 'package:flutter_ddd_with_firebase/domain/core/ValueObjects.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/ToDoItem.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/ValueObjects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'TodoItemPresentationClasses.freezed.dart';

@freezed
abstract class TodoItemPrimitive implements _$TodoItemPrimitive {
  const TodoItemPrimitive._();

  const factory TodoItemPrimitive({
    required UniqueId id,
    required String name,
    required bool done,
  }) = _TodoItemPrimitive;

  factory TodoItemPrimitive.empty() => TodoItemPrimitive(
        id: UniqueId(),
        name: "",
        done: false,
      );

  factory TodoItemPrimitive.fromDomain(ToDoItem toDoItem) => TodoItemPrimitive(
        id: toDoItem.id,
        name: toDoItem.name.getOrCrash(),
        done: toDoItem.done,
      );

  ToDoItem toDomain() {
    return ToDoItem(
      id: id,
      name: TodoName(name),
      done: done,
    );
  }
}
