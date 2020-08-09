import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisplu_ecocode/bloc/register/bloc.dart';
import 'package:wisplu_ecocode/generated/l10n.dart';
import 'package:wisplu_ecocode/page/login/login_TextFormField.dart';
import '../../common/styles/constants.dart';
import '../../bloc/authentication_bloc/authentication_bloc.dart';
import '../register/register.dart';

class ForgotPasswordForm extends StatefulWidget {
  State<RegisterForm> createState() => _ForgotPasswordForm();
}

class _ForgotPasswordForm extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Registering...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          // BlocProvider.of<AuthenticationBloc>(context)
          //     .add(AuthenticationLoggedIn());
          Navigator.of(context).pop();
        }
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Registration Failure'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              gradient: kScaffoldBackgroundGradient,
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                    ),
                    LoginTextFormField(
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      icon: Icons.email,
                      iconColor: Colors.white,
                      hintText: S.of(context).emailForm,
                      validator: (_) {
                        return !state.isEmailValid
                            ? S.of(context).loginTextFormEmail
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LoginTextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      icon: Icons.lock,
                      iconColor: Colors.white,
                      hintText: S.of(context).passwordForm,
                      validator: (_) {
                        return !state.isPasswordValid
                            ? S.of(context).loginForgetPassword
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RegisterButton(
                      onPressed: isRegisterButtonEnabled(state)
                          ? _onFormSubmitted
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _registerBloc.add(
      RegisterEmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _registerBloc.add(
      RegisterPasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _registerBloc.add(
      RegisterSubmitted(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

}
