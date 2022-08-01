import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/AuthFailure.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/ValueObjects.dart';

/**
 * ! Firebase Auth, Google Sign In
 */
abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<Either<AuthFailure, Unit>> logout();
}
