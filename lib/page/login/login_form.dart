import 'package:flutter/material.dart';
// import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class _LoginFormState extends State<LoginForm> with TickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
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
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).loginTrue,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
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
                      controller: _emailController,
                      icon: Icons.email,
                      iconColor: Colors.white,
                      hintText: "Email",
                      validator: (_) {
                        return !state.isEmailValid
                            ? S.of(context).loginTextFormEmail
                            : null;
                      },
                    ),
                    // TextFormField(
                    //   controller: _emailController,
                    //   decoration: InputDecoration(
                    //     filled: true, //背景是否填充
                    //     fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                    //     prefixIcon: Icon(
                    //       Icons.email,
                    //       color: Colors.white,
                    //     ),
                    //     hintText: 'Email',
                    //     hintStyle: new TextStyle(color: Colors.white),
                    //   ),
                    //   keyboardType: TextInputType.emailAddress,
                    //   autovalidate: true,
                    //   autocorrect: false,
                    //   validator: (_) {
                    //     return !state.isEmailValid ? 'Invalid Email' : null;
                    //   },
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    LoginTextFormField(
                      controller: _passwordController,
                      icon: Icons.lock,
                      iconColor: Colors.white,
                      hintText: "password",
                      validator: (_) {
                        return !state.isPasswordValid
                            ? S.of(context).loginTextFormPassword
                            : null;
                      },
                    ),
                    // TextFormField(
                    //   controller: _passwordController,
                    //   decoration: InputDecoration(
                    //     prefixIcon: Icon(
                    //       Icons.lock,
                    //       color: Colors.white,
                    //     ),
                    //     filled: true, //背景是否填充
                    //     fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                    //     hintText: "password",
                    //     hintStyle: new TextStyle(color: Colors.white),
                    //   ),
                    //   obscureText: true,
                    //   autovalidate: true,
                    //   autocorrect: false,
                    //   validator: (_) {
                    //     return !state.isPasswordValid
                    //         ? 'Invalid Password'
                    //         : null;
                    //   },
                    // ),
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
                          onTap: isLoginButtonEnabled(state)
                              ? _onFormSubmitted
                              : null,
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
                        GoogleLoginButton(
                          text: S.of(context).loginGoogleButton,
                          onTap: () {
                            BlocProvider.of<LoginBloc>(context)
                                .add(LoginWithGooglePressed());
                          },
                          buttonController: _loginButtonController.view,
                        ),
                        SizedBox(height: 10),
                        FacebookLoginButton(
                          text:S.of(context).loginFacebookButton,
                          onTap: null,
                          buttonController: _loginButtonController.view,
                        ),
                        SizedBox(height: 10),
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
