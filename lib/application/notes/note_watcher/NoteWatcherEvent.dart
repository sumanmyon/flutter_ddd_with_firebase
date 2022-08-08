import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/NoteFailure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

import '../../../domain/notes/Note.dart';

part 'NoteWatcherEvent.freezed.dart';

@freezed
abstract class NoteWatcherEvent with _$NoteWatcherEvent {
  const factory NoteWatcherEvent.watchAllStarted() = _WatchAllStarted;

  const factory NoteWatcherEvent.watchUncompletedStarted() =
      _WatchUncompletedStarted;

  const factory NoteWatcherEvent.notesReceived(
      Either<NoteFailure, KtList<Note>> failureOrNotes) = _NotesReceived;
}
