import 'package:flutter_ddd_with_firebase/domain/core/ValueObjects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'User.freezed.dart';

@freezed
abstract class User with _$User{
  const factory User({
    required UniqueId id,
}) = _User;
}