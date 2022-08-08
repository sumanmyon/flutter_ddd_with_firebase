import 'package:flutter_ddd_with_firebase/domain/notes/Note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'NoteActorEvent.freezed.dart';

@freezed
abstract class NoteActorEvent with _$NoteActorEvent{
  const factory NoteActorEvent.deleted(Note note) = _Deleted;
}
