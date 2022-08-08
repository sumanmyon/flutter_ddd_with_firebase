import 'package:freezed_annotation/freezed_annotation.dart';

part 'Failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    required T failedValue,
  }) = ShortPassword<T>;

  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;

  const factory ValueFailure.multiline({
    required T failedValue,
  }) = Multiline<T>;

  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;

  const factory ValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;
}

// @freezed
// abstract class ValueFailure<T> with _$ValueFailure<T> {
//   const factory ValueFailure.auth(AuthValueFailure<T> f) = _Auth<T>;
//   const factory ValueFailure.note_watcher(NoteValueFailure<T> f) = _Notes<T>;
// }
//
// @freezed
// abstract class AuthValueFailure<T> with _$AuthValueFailure<T> {
//   const factory AuthValueFailure.invalidEmail({
//     required String failedValue,
//   }) = InvalidEmail<T>;
//
//   const factory AuthValueFailure.shortPassword({
//     required String failedValue,
//   }) = ShortPassword<T>;
// }
//
// @freezed
// abstract class NoteValueFailure<T> with _$NoteValueFailure<T> {
//   const factory NoteValueFailure.exceedingLength({
//     required String failedValue,
//   }) = ExceedingLength<T>;
// }
