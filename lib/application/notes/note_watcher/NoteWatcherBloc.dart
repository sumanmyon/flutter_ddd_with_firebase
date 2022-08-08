import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/application/notes/note_watcher/NoteWatcherEvent.dart';
import 'package:flutter_ddd_with_firebase/application/notes/note_watcher/NoteWatcherState.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/INoteRepository.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/Note.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/NoteFailure.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

@injectable
class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  final INoteRepository _noteRepository;
  StreamSubscription<Either<NoteFailure, KtList<Note>>>? noteStreamSubscription;

  NoteWatcherBloc(this._noteRepository)
      : super(const NoteWatcherState.initial()) {
    on<NoteWatcherEvent>(
      (event, emit) async {
        //Flutter Firebase & DDD Course [15] - Note Watcher & Actor Blocs
        await event.map(watchAllStarted: (e) async {
          emit(const NoteWatcherState.loadingProgress());
          await noteStreamSubscription?.cancel();
          noteStreamSubscription = _noteRepository.watchAll().listen(
                (notes) => add(
                  NoteWatcherEvent.notesReceived(notes),
                ),
              );

          //Wrong way
          // _noteRepository.watchAll().map(
          //       (failureOrNotes) => failureOrNotes.fold(
          //         (f) => emit(NoteWatcherState.loadFailure(f)),
          //         (notes) => emit(NoteWatcherState.loadSuccess(notes)),
          //       ),
          //     );
        }, watchUncompletedStarted: (e) async {
          emit(const NoteWatcherState.loadingProgress());
          await noteStreamSubscription?.cancel();
          noteStreamSubscription = _noteRepository.watchUncompleted().listen(
                (notes) => add(
                  NoteWatcherEvent.notesReceived(notes),
                ),
              );
        }, notesReceived: (e) {
          emit(e.failureOrNotes.fold(
            (f) => NoteWatcherState.loadFailure(f),
            (notes) => NoteWatcherState.loadSuccess(notes),
          ));
        });
      },
    );
  }

  @override
  Future<void> close() async {
    await noteStreamSubscription?.cancel();
    return super.close();
  }
}
