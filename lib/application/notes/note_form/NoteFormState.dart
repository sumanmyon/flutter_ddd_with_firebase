import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/Note.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/NoteFailure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'NoteFormState.freezed.dart';

@freezed
abstract class NoteFormState with _$NoteFormState {
  const factory NoteFormState({
    required Note note,
    required bool showErrorMessages,
    required bool saving,
    required bool isEditing,
    required Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOrOption,
  }) = _NoteFormState;

  factory NoteFormState.initial() => NoteFormState(
        note: Note.empty(),
        showErrorMessages: false,
        isEditing: false,
        saving: false,
        saveFailureOrSuccessOrOption: none(),
      );
}
