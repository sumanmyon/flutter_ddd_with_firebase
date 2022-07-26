import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ddd_with_firebase/Injection.dart';

import 'package:flutter_ddd_with_firebase/Injection.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/IAuthFacade.dart';
import 'package:flutter_ddd_with_firebase/domain/core/Errors.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance
        .collection("user")
        .doc(user.id.getOrCrash());
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteCollection => collection("notes");
}
