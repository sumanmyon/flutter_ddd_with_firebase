import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ddd_with_firebase/domain/core/User.dart' as user;
import 'package:flutter_ddd_with_firebase/domain/core/ValueObjects.dart';

extension FirebaseUserDomainX on User {
  user.User toDomain() {
    return user.User(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
