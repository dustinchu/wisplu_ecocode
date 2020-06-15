import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../generated/l10n.dart';
import '../../bloc/authentication_bloc/authentication_bloc.dart';
import '../../bloc/login/bloc.dart';
import '../register/register_screen.dart';
import '../../common/styles/constants.dart';
import '../../widget/animation_button.dart';
import '../../user_repository.dart';
import '../login/login.dart';
import '../../common/styles/colors.dart';
import 'facebook_login_button.dart';
import 'google_login_button.dart';
import 'login_TextFormField.dart';

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;

  LoginForm({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with TickerProviderStateMixin , AfterLayoutMixin{
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
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          _loginButtonController.reverse();
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).loginFalse,
                    ),
                    Icon(Icons.error)
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state.isSubmitting) {
          _loginButtonController.forward();
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).loging,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          _loginButtonController.reverse();
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticationLoggedIn());
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: kScaffoldBackgroundGradient,
        ),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
              child: Form(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Image.asset('assets/brandLogo.png',
                          height: MediaQuery.of(context).size.width / 4 + 20),
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
                            ? S.of(context).loginTextFormPassword
                            : null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            S.of(context).loginForgotPassword,
                            style: TextStyle(color: kLoginTextColor),
                            // style: TextStyle(
                            //     color: Color.fromRGBO(195, 159, 43, 1)),
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        StaggerAnimation(
                          borderColor: Colors.white,
                          color: Colors.transparent,
                          circular: 0,
                          text: S.of(context).loginButton,
                          textColor: Colors.white,
                          buttonController: _loginButtonController.view,
                          onTap: () async {
                            await _loginButtonController.forward();
                            Future.delayed(const Duration(milliseconds: 2000),
                                () {
                              _loginButtonController.reverse();
                            });
                          },
                          // onTap: isLoginButtonEnabled(state)
                          //     ? _onFormSubmitted
                          //     : null,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 0.5,
                                    color: Colors.white,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  S.of(context).loginOther,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
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
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Image.asset("assets/facebook.png"),
                              onPressed: () => print("123"),
                            ),
                            IconButton(
                              icon: Image.asset("assets/google-logo.png"),
                              onPressed: () => print("123"),
                            ),
                            IconButton(
                                icon:
                                    Image.asset("assets/apple_logo_white.png"),
                                onPressed: () => print("123")),
                          ],
                        ),
                        // GoogleLoginButton(
                        //   text: S.of(context).loginGoogleButton,
                        //   onTap: () {
                        //     BlocProvider.of<LoginBloc>(context)
                        //         .add(LoginWithGooglePressed());
                        //   },
                        //   buttonController: _loginButtonController.view,
                        // ),
                        // SizedBox(height: 10),
                        // FacebookLoginButton(
                        //   text: S.of(context).loginFacebookButton,
                        //   onTap: null,
                        //   buttonController: _loginButtonController.view,
                        // ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).loginNoAccount,
                                style: TextStyle(color: kTextColor)),
                            CreateAccountButton(
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
