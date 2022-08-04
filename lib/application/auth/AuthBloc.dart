import 'package:bloc/bloc.dart';
import 'package:flutter_ddd_with_firebase/application/auth/AuthEvent.dart';
import 'package:flutter_ddd_with_firebase/application/auth/AuthState.dart';
import 'package:flutter_ddd_with_firebase/domain/auth/IAuthFacade.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade iAuthFacade;

  AuthBloc(this.iAuthFacade) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) {
      event.map(
        authCheckRequested: (e) async {
          final userOption = await iAuthFacade.getSignedInUser();
          emit(userOption.fold(
            () => const AuthState.unauthenticated(),
            (a) => const AuthState.authenticated(),
          ));
        },
        signedOut: (e) async {
          await iAuthFacade.signOut();
          emit(const AuthState.unauthenticated());
        },
      );
    });
  }
}
