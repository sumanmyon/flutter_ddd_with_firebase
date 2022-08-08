import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/Note.dart';
import 'package:flutter_ddd_with_firebase/domain/notes/NoteFailure.dart';
import 'package:kt_dart/collection.dart';

abstract class INoteRepository {
  Stream<Either<NoteFailure, KtList<Note>>> watchAll();

  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();

  Future<Either<NoteFailure, Unit>> create({required Note note});

  Future<Either<NoteFailure, Unit>> update({required Note note});

  Future<Either<NoteFailure, Unit>> delete({required Note note});
}
