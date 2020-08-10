import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/login/bloc.dart';
import '../../user_repository.dart';
import '../login/login.dart';
class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
          child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(userRepository: _userRepository),
            child: LoginForm(userRepository: _userRepository),
          ),
      ),
    );
  }
}
