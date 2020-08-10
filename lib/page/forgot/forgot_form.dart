import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/forgot/bloc.dart';
import '../../generated/l10n.dart';
import '../login/login_TextFormField.dart';
import '../../common/styles/constants.dart';
import 'forgot.dart';

class ForgotForm extends StatefulWidget {
  State<ForgotForm> createState() => _ForgotPasswordForm();
}

class _ForgotPasswordForm extends State<ForgotForm> {
  final TextEditingController _emailController = TextEditingController();

  ForgotBloc _forgotBloc;

  bool get isPopulated => _emailController.text.isNotEmpty;

  bool isForgotButtonEnabled(ForgotState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _forgotBloc = BlocProvider.of<ForgotBloc>(context);
    _emailController.addListener(_onEmailChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotBloc, ForgotState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Forgoting...'),
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
      child: BlocBuilder<ForgotBloc, ForgotState>(
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

                    ForgotButton(
                      onPressed: isForgotButtonEnabled(state)
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
    super.dispose();
  }

  void _onEmailChanged() {
    _forgotBloc.add(
      ForgotEmailChanged(email: _emailController.text),
    );
  }

  void _onFormSubmitted() {
    _forgotBloc.add(
      ForgotSubmitted(
        email: _emailController.text,
      ),
    );
  }
}
