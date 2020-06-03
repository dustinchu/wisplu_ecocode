import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'authentication_bloc/authentication_bloc.dart';
import 'page/home/home_screen.dart';
import 'user_repository.dart';
// import 'home_screen.dart';
import 'login/login.dart';
import 'bloc_delegate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = blocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository,
      )..add(AuthenticationStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
          // textTheme: Typography(platform: TargetPlatform.iOS).white,

          textTheme: GoogleFonts.openSansTextTheme()),
      // home: HomeScreen(),
      home:LoginScreen(userRepository: _userRepository),
      // home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
      //   builder: (context, state) {
      //     if (state is AuthenticationFailure) {
      //       return LoginScreen(userRepository: _userRepository);
      //     }
      //     if (state is AuthenticationSuccess) {
      //       return HomeScreen(name: state.displayName);
      //     }
      //     return SplashScreen();
      //   },
      // ),
    );
  }
}
