import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/show_message_dialog.dart';
import '../../generated/l10n.dart';
import '../../bloc/authentication_bloc/authentication_bloc.dart';
import '../../bloc/login/bloc.dart';
import '../register/register_screen.dart';
import '../../common/styles/constants.dart';
import '../../widget/animation_button.dart';
import '../../user_repository.dart';
import '../login/login.dart';
import '../../common/styles/colors.dart';
import 'auth-exception.dart';
import 'login_TextFormField.dart';
import '../forgot/forgot.dart';

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;

  LoginForm({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with TickerProviderStateMixin, AfterLayoutMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AnimationController _loginButtonController;
  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    _loginButtonController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    try {
      setState(() {});
    } catch (e) {
      print("[Login] afterFirstLayout error${e}");
    }
  }

  Future<Null> _playAnimation() async {
    try {
      setState(() {});
      await _loginButtonController.forward();
    } on TickerCanceled {
      print('[_playAnimation] error');
    }
  }

  Future<Null> _stopAnimation() async {
    try {
      await _loginButtonController.reverse();
      setState(() {});
    } on TickerCanceled {
      print('[_stopAnimation] error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state.isFailure) {
          print(
              "ErrorCode${AuthExceptionHandler.handleException(context, state.isErrorCode)}");
          ShowMessageDialog(context,
              AuthExceptionHandler.handleException(context, state.isErrorCode));
          _stopAnimation();
        }
        if (state.isSubmitting) {
          await _playAnimation();
          _loginButtonController.forward();
        }
        if (state.isSuccess) {
          _stopAnimation();
          if (state.isEmailVerified) {
            _loginButtonController.reverse();
            BlocProvider.of<AuthenticationBloc>(context)
                .add(AuthenticationLoggedIn());
          } else {
            ShowMessageDialog(context, S.of(context).emailVerifiedFailed);
            _stopAnimation();
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: kScaffoldBackgroundGradient,
        ),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Image.asset(
                        'assets/brandLogo.png',
                        height: MediaQuery.of(context).size.width / 2 + 20,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Wisplu",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //信箱
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
                    //密碼
                    LoginTextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      icon: Icons.lock,
                      iconColor: Colors.white,
                      hintText: S.of(context).passwordForm,
                      validator: (_) {
                        return !state.isPasswordValid
                            ? S.of(context).loginTextFormPassword
                            : null;
                      },
                    ),
                    //忘記密碼
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextBtn(
                              text: S.of(context).loginForgotPassword,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return ForgotPasswordScreen(
                                        userRepository: _userRepository);
                                  }),
                                );
                              }),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        StaggerAnimation(
                          borderColor: Colors.white,
                          color: Colors.transparent,
                          circular: 10,
                          text: S.of(context).loginButton,
                          textColor: Colors.white,
                          buttonController: _loginButtonController.view,
                          // onTap: () async {
                          onTap: isLoginButtonEnabled(state)
                              ? _onFormSubmitted
                              : null,
                        ),
                        rowDivider(),
                        //Google登入
                        StaggerAnimation(
                          borderColor: Colors.white,
                          color: Colors.transparent,
                          circular: 10,
                          text: S.of(context).loginGoogleButton,
                          textColor: Colors.white,
                          buttonController: _loginButtonController.view,
                          // onTap: () async {
                          onTap: () => BlocProvider.of<LoginBloc>(context)
                              .add(LoginWithGooglePressed()),
                          iconStatus: true,
                          iconPath: "assets/login_button_logo/google.png",
                        ),
                        //Apple登入
                        SizedBox(
                          height: 20,
                        ),
                        StaggerAnimation(
                          borderColor: Colors.white,
                          color: Colors.transparent,
                          circular: 10,
                          text: S.of(context).loginAppleButton,
                          textColor: Colors.white,
                          buttonController: _loginButtonController.view,
                          // onTap: () async {
                          onTap: () => BlocProvider.of<LoginBloc>(context)
                              .add(LoginWithApplePressed()),
                          iconStatus: true,
                          iconPath: "assets/login_button_logo/apple_white.png",
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).loginNoAccount,
                                style: TextStyle(color: kTextColor)),
                            TextBtn(
                                text: S.of(context).loginSignIn,
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return RegisterScreen(
                                          userRepository: _userRepository);
                                    }),
                                  );
                                }),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

//分隔線 使用其他方式登入
  Widget rowDivider() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 0.5,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              S.of(context).loginOther,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                height: 0.5,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _loginButtonController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(
      LoginEmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      LoginPasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginWithCredentialsPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
