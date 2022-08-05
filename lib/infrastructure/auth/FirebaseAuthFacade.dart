import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/AuthFailure.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/IAuthFacade.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/ValueObjects.dart';
import 'package:flutter_ddd_with_firebase/domain/core/User.dart' as user;
import 'package:flutter_ddd_with_firebase/domain/core/ValueObjects.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import './FirebaseUserMapper.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  FirebaseAuthFacade({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUsed());
      } else {
        return left(const AuthFailure.serverError());
      }
    } on Exception catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'wrong-password' || e.code == 'user-not-found') {
        return left(const AuthFailure.inValidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    } on Exception catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      var user = googleUser.displayName;

      final googleAuth = await googleUser.authentication;
      if (kDebugMode) {
        print(
          "user= ${user}",
        );
        print(
          "accessToken= ${googleAuth.accessToken}\nidToken= ${googleAuth.idToken}",
        );
      }

      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // final userCredential =
      //     await FirebaseAuth.instance.signInWithCredential(authCredential);
      await FirebaseAuth.instance.signInWithCredential(authCredential);

      return right(unit);
    } on FirebaseException catch (e) {
      return left(const AuthFailure.serverError());
    } on Exception catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Option<user.User>> getSignedInUser() {
    var firebaseUser = firebaseAuth.currentUser;
    return Future.value(
      optionOf(firebaseUser?.toDomain()),
    );
  }

  @override
  Future<void> signOut() {
    return Future.wait({
      googleSignIn.signOut(),
      firebaseAuth.signOut(),
    });
  }
}
