import 'package:meta/meta.dart';

@immutable
class LoginState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final bool isEmailVerified;
  final  isErrorCode;

  bool get isFormValid => isEmailValid && isPasswordValid;

  LoginState({
    @required this.isEmailValid,
    @required this.isPasswordValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.isEmailVerified,
    @required this.isErrorCode,
  });

  factory LoginState.initial() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isEmailVerified: false,
      isErrorCode: null
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isEmailVerified: true,
      isSuccess: false,
      isFailure: false,
      isErrorCode: null
    );
  }

  factory LoginState.failure( errorCode) {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isEmailVerified: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      isErrorCode: errorCode,
    );
  }
  factory LoginState.verifiedFailure() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isEmailVerified: false,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      isErrorCode: null
    );
  }
  factory LoginState.success() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isEmailVerified: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      isErrorCode: null
    );
  }

  LoginState update({
    bool isEmailValid,
    bool isPasswordValid,
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isEmailVerified: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  LoginState copyWith({
    bool isEmailValid,
    bool isPasswordValid,
    bool isSubmitEnabled,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    bool isEmailVerified,
  }) {
    return LoginState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isEmailVerified: isEmailVerified ?? this.isEmailValid,
      isErrorCode: null
    );
  }

  @override
  String toString() {
    return '''LoginState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isEmailVerified: $isEmailVerified,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      isErrorCode: $isErrorCode,
    }''';
  }
}
