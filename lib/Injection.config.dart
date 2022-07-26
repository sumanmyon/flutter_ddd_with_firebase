// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i9;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/AuthBloc.dart' as _i14;
import 'application/auth/sign_in_form/SignInFormBloc.dart' as _i13;
import 'application/notes/note_actor/NoteActorBloc.dart' as _i10;
import 'application/notes/note_form/NoteFormBloc.dart' as _i11;
import 'application/notes/note_watcher/NoteWatcherBloc.dart' as _i12;
import 'domain/auth/IAuthFacade.dart' as _i5;
import 'domain/notes/INoteRepository.dart' as _i7;
import 'infrastructure/auth/FirebaseAuthFacade.dart' as _i6;
import 'infrastructure/core/FirebaseInjectableModule.dart' as _i15;
import 'infrastructure/notes/NoteRepository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.GoogleSignIn>(
      () => firebaseInjectableModule.gooleSignIn);
  gh.lazySingleton<_i5.IAuthFacade>(() => _i6.FirebaseAuthFacade(
      firebaseAuth: get<_i3.FirebaseAuth>(),
      googleSignIn: get<_i4.GoogleSignIn>()));
  gh.lazySingleton<_i7.INoteRepository>(
      () => _i8.NoteRepository(get<_i9.FirebaseFirestore>()));
  gh.factory<_i10.NoteActorBloc>(
      () => _i10.NoteActorBloc(get<_i7.INoteRepository>()));
  gh.factory<_i11.NoteFormBloc>(
      () => _i11.NoteFormBloc(get<_i7.INoteRepository>()));
  gh.factory<_i12.NoteWatcherBloc>(
      () => _i12.NoteWatcherBloc(get<_i7.INoteRepository>()));
  gh.factory<_i13.SignInFormBloc>(
      () => _i13.SignInFormBloc(get<_i5.IAuthFacade>()));
  gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(get<_i5.IAuthFacade>()));
  return get;
}

class _$FirebaseInjectableModule extends _i15.FirebaseInjectableModule {}
