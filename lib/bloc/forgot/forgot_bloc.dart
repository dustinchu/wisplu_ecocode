import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import '../../user_repository.dart';
import '../../common/utif/validators.dart';
import 'bloc.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  final UserRepository _userRepository;

  ForgotBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ForgotState get initialState => ForgotState.initial();

  @override
  Stream<Transition<ForgotEvent, ForgotState>> transformEvents(
    Stream<ForgotEvent> events,
    TransitionFunction<ForgotEvent, ForgotState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! ForgotEmailChanged && event is! ForgotPasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is ForgotEmailChanged || event is ForgotPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<ForgotState> mapEventToState(
    ForgotEvent event,
  ) async* {
    if (event is ForgotEmailChanged) {
      yield* _mapForgotEmailChangedToState(event.email);
    } else if (event is ForgotSubmitted) {
      yield* _mapForgotSubmittedToState(event.email);
    }
  }

  Stream<ForgotState> _mapForgotEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<ForgotState> _mapForgotSubmittedToState(
    String email,
  ) async* {
    yield ForgotState.loading();
    try {
      await _userRepository.sendPasswordResetEmail(email);
      yield ForgotState.success();
    } catch (_) {
      print("error==${_}");
      yield ForgotState.failure();
    }
  }
}
