import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/application/notes/note_form/misc/TodoItemPresentationClasses.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/Note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'NoteFormEvent.freezed.dart';

@freezed
abstract class NoteFormEvent with _$NoteFormEvent {
  const factory NoteFormEvent.initialized(Option<Note> initialNoteOption) =
      _Initialized;

  const factory NoteFormEvent.bodyChanged(String bodyStr) = _BodyChanged;

  const factory NoteFormEvent.colorChanged(Color color) = _ColorChanged;

  const factory NoteFormEvent.todosChanged(KtList<TodoItemPrimitive> todos) =
      _TodosChanged;

  const factory NoteFormEvent.saved() = _Saved;
}
