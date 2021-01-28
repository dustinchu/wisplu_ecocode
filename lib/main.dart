import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'bloc/authentication_bloc/authentication_bloc.dart';
import 'bloc/preferences/preferences_bloc.dart';
import 'bloc/preferences/preferences_state.dart';
import 'generated/l10n.dart';
import 'page/home/home_screen.dart';
import 'page/login/login.dart';
import 'repositories/preferences/preferences_repository_impl.dart';
import 'splash_screen.dart';
import 'user_repository.dart';
import 'common/utif/bloc_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = blocDelegate();
  final UserRepository userRepository = UserRepository();
  //讀取本地儲存的語言
  final preferencesRepository = PreferencesRepositoryImpl();
  var initLocale = await preferencesRepository.locale;
  runApp(
    //BLOC init
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => PreferencesBloc(
                  preferencesRepository: preferencesRepository,
                  initialLocale: initLocale,
                )),
        BlocProvider(
          //認證帳號有沒有登入過
          create: (context) => AuthenticationBloc(
            userRepository: userRepository,
          )..add(AuthenticationStarted()),
          child: App(userRepository: userRepository),
        ),
      ],
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
    return BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (context, localState) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Intl Example',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
          LocaleNamesLocalizationsDelegate(),
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: localState.locale,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
          //  return HomeScreen();
          //判斷認證進入畫面
            if (state is AuthenticationFailure) {
              return LoginScreen(userRepository: _userRepository);
            }
            if (state is AuthenticationSuccess) {
              // return HomeScreen(name: state.displayName);
              return HomeScreen();
            }
            return SplashScreen();
          },
        ),
      );
    });
  }
}
