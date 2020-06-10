import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisplu_ecocode/generated/l10n.dart';
import '../../common/styles/constants.dart';
import '../../bloc/register/bloc.dart';
import '../../bloc/authentication_bloc/authentication_bloc.dart';
import '../register/register.dart';
import '../../widget/arrow_appbar.dart';

class RegisterForm extends StatefulWidget {
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
                    Text(S.of(context).registration),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticationLoggedIn());
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
                    Text(S.of(context).registrationFailure),
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
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              gradient: kScaffoldBackgroundGradient,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ArrowAppbar(
                  text: S.of(context).registerTitle,
                  onPressed: () => Navigator.pop(context, true),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    child: ListView(
                      children: <Widget>[
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText: S.of(context).emailForm,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          autovalidate: true,
                          validator: (_) {
                            return !state.isEmailValid
                                ? S.of(context).loginTextFormEmail
                                : null;
                          },
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: S.of(context).passwordForm,
                          ),
                          obscureText: true,
                          autocorrect: false,
                          autovalidate: true,
                          validator: (_) {
                            return !state.isPasswordValid
                                ? S.of(context).loginTextFormPassword
                                : null;
                          },
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
              ],
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
