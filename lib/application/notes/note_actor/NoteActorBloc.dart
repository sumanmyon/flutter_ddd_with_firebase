import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/INoteRepository.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/NoteFailure.dart';
import 'package:injectable/injectable.dart';
import 'NoteActorEvent.dart';
import 'NoteActorState.dart';

@injectable
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository _noteRepository;

  NoteActorBloc(this._noteRepository) : super(NoteActorState.initial()) {
    on<NoteActorEvent>((event, emit) async {
      await event.map(
        deleted: (e) async {
          emit(const NoteActorState.actionInProgress());
          final possibleFailure = await _noteRepository.delete(note: e.note);
          emit(possibleFailure.fold(
            (f) => NoteActorState.deleteFailure(f),
            (r) => const NoteActorState.deleteSuccess(),
          ));
        },
      );
    });
  }
}
