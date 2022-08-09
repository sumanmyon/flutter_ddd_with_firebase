import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/INoteRepository.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/NoteFailure.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/ValueObjects.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'NoteFormEvent.dart';
import 'NoteFormState.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final INoteRepository _noteRepository;

  NoteFormBloc(this._noteRepository) : super(NoteFormState.initial()) {
    on<NoteFormEvent>((event, emit) async {
      await event.map(
        initialized: (e) {
          emit(e.initialNoteOption.fold(
            () => state,
            (initialNote) => state.copyWith(
              note: initialNote,
              isEditing: true,
            ),
          ));
        },
        bodyChanged: (e) {
          emit(state.copyWith(
            note: state.note.copyWith(body: NoteBody(e.bodyStr)),
            saveFailureOrSuccessOrOption: none(),
          ));
        },
        colorChanged: (e) {
          emit(state.copyWith(
            note: state.note.copyWith(color: NoteColor(e.color)),
            saveFailureOrSuccessOrOption: none(),
          ));
        },
        todosChanged: (e) {
          emit(state.copyWith(
            note: state.note.copyWith(
              todos: List3(e.todos.map((primitive) => primitive.toDomain())),
            ),
            saveFailureOrSuccessOrOption: none(),
          ));
        },
        saved: (e) async {
          Either<NoteFailure, Unit>? failureOrSuccess;

          emit(state.copyWith(
            saving: true,
            saveFailureOrSuccessOrOption: none(),
          ));

          if (state.note.failureOption.isNone()) {
            failureOrSuccess = state.isEditing
                ? await _noteRepository.update(note: state.note)
                : await _noteRepository.create(note: state.note);
          }

          emit(state.copyWith(
            saving: false,
            showErrorMessages: true,
            saveFailureOrSuccessOrOption: optionOf(failureOrSuccess),
          ));
        },
      );
    });
  }
}
