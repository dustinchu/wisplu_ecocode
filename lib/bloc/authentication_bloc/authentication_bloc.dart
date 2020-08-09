import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => AuthenticationInitial();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    try {
      if (event is AuthenticationStarted) {
        yield* _mapAuthenticationStartedToState();
      } else if (event is AuthenticationLoggedIn) {
        yield* _mapAuthenticationLoggedInToState();
      } else if (event is AuthenticationLoggedOut) {
        yield* _mapAuthenticationLoggedOutToState();
      }
    } catch (e) {
      print("ERROR===${e}");
    }
  }

  Stream<AuthenticationState> _mapAuthenticationStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final isVerified = await _userRepository.checkEmailVerified();
        //判斷信箱是否有認證
        if (isVerified) {
          final name = await _userRepository.getUser();
          yield AuthenticationSuccess(name);
        } else {
          yield AuthenticationFailure();
        }
      } else {
        yield AuthenticationFailure();
      }
    } catch (e) {
      print("123213=====${e}");
    }
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedInToState() async* {
    yield AuthenticationSuccess(await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedOutToState() async* {
    yield AuthenticationFailure();
    _userRepository.signOut();
  }
}
