import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_ddd_with_firebase/Injection.config.dart';

final GetIt getIt = GetIt.instance;

//https://pub.dev/packages/injectable
@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
