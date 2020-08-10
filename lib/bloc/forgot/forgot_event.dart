import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ForgotEvent extends Equatable {
  const ForgotEvent();

  @override
  List<Object> get props => [];
}

class ForgotEmailChanged extends ForgotEvent {
  final String email;

  const ForgotEmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class ForgotPasswordChanged extends ForgotEvent {
  final String password;

  const ForgotPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}
class ForgotSendEmail extends ForgotEvent {
  final String email;
  final String password;

  const ForgotSendEmail({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }
}
class ForgotSubmitted extends ForgotEvent {
  final String email;

  const ForgotSubmitted({
    @required this.email,
  });

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'Submitted { email: $email}';
  }
}
