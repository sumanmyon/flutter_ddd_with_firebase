import 'package:flutter_ddd_with_firebase/domain/notes/NoteFailure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'NoteActorState.freezed.dart';

@freezed
abstract class NoteActorState with _$NoteActorState {
  const factory NoteActorState.initial() = _Initial;

  const factory NoteActorState.actionInProgress() = _ActionInProgress;

  const factory NoteActorState.deleteFailure(NoteFailure noteFailure) =
      _DeleteFailure;

  const factory NoteActorState.deleteSuccess() = _DeleteSuccess;
}
