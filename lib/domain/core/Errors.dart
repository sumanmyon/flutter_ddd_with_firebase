import 'package:flutter_ddd_with_firebase/domain/core/Failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        "Encounter a ValueFailure at an unreachable point. Terminating.";
    return Error.safeToString("${explanation} Failure was ${valueFailure}");
  }
}
