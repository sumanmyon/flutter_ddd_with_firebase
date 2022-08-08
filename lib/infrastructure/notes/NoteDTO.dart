import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddd_with_firebase/domain/core/ValueObjects.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/Note.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/ToDoItem.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/ValueObjects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'NoteDTO.freezed.dart';

part 'NoteDTO.g.dart';

@freezed
abstract class NoteDTO with _$NoteDTO {
  const NoteDTO._();

  const factory NoteDTO({
    @JsonKey(ignore: true) String? id,
    required String body,
    required int color,
    required List<TodoItemDTO> todos,
    @ServerTimestampConverter() required FieldValue serverTimeStamp,
  }) = _NoteDTO;

  factory NoteDTO.fromDomain(Note note) {
    return NoteDTO(
      id: note.id.getOrCrash(),
      body: note.body.getOrCrash(),
      color: note.color.getOrCrash().value,
      todos: note.todos
          .getOrCrash()
          .map(
            (todoItem) => TodoItemDTO.fromDomain(todoItem),
          )
          .asList(),
      serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueString(id),
      body: NoteBody(body),
      color: NoteColor(Color(color)),
      todos: List3(todos.map((dto) => dto.toDomain()).toImmutableList()),
    );
  }

  factory NoteDTO.fromJson(Map<String, dynamic> json) =>
      _$NoteDTOFromJson(json);

  factory NoteDTO.fromFirestore(DocumentSnapshot doc) {
    return NoteDTO.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) {
    return fieldValue;
  }
}

@freezed
abstract class TodoItemDTO implements _$TodoItemDTO {
  const TodoItemDTO._();

  const factory TodoItemDTO({
    required String id,
    required String name,
    required bool done,
  }) = _TodoItemDTO;

  factory TodoItemDTO.fromDomain(ToDoItem toDoItem) {
    return TodoItemDTO(
      id: toDoItem.id.getOrCrash(),
      name: toDoItem.name.getOrCrash(),
      done: toDoItem.done,
    );
  }

  ToDoItem toDomain() {
    return ToDoItem(
      id: UniqueId.fromUniqueString(id),
      name: TodoName(name),
      done: done,
    );
  }

  factory TodoItemDTO.fromJson(Map<String, dynamic> json) =>
      _$TodoItemDTOFromJson(json);

// factory TodoItemDTO.fromFirestore(DocumentSnapshot doc) {
//   return TodoItemDTO.fromJson(doc.data()).copyWith(id: doc.id);
// }
}
