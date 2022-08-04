import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AuthEvent.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent{
   const factory AuthEvent.authCheckRequested() = AuthCheckRequested;
   const factory AuthEvent.signedOut() = SignedOut;
}