import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/AuthFailure.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/ValueObjects.dart';
import 'package:flutter_ddd_with_firebase/domain/core/User.dart' as user;

/**
 * ! Firebase Auth, Google Sign In
 */
abstract class IAuthFacade {
  Future<Option<user.User>> getSignedInUser();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<void> signOut();
}
