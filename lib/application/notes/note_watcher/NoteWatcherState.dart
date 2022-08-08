import 'package:flutter_ddd_with_firebase/domain/notes/Note.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/NoteFailure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'NoteWatcherState.freezed.dart';

@freezed
abstract class NoteWatcherState with _$NoteWatcherState {
  const factory NoteWatcherState.initial() = _Initial;

  const factory NoteWatcherState.loadingProgress() = _LoadingProgress;

  const factory NoteWatcherState.loadSuccess(KtList<Note> notes) = _LoadSuccess;

  const factory NoteWatcherState.loadFailure(NoteFailure failure) =
      _LoadFailure;
}
