import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/forgot/bloc.dart';
import '../../user_repository.dart';
import 'forgot_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final UserRepository _userRepository;

  ForgotPasswordScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('forgot')),
      body: Center(
        child: BlocProvider<ForgotBloc>(
          create: (context) => ForgotBloc(userRepository: _userRepository),
          child: ForgotForm(),
        ),
      ),
    );
  }
}
