// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S();
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S();
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get simpleText {
    return Intl.message(
      '嗨TW',
      name: 'simpleText',
      desc: '',
      args: [],
    );
  }

  String get loginTrue {
    return Intl.message(
      '登入成功',
      name: 'loginTrue',
      desc: '',
      args: [],
    );
  }

  String get loginFalse {
    return Intl.message(
      '登入發生錯誤',
      name: 'loginFalse',
      desc: '',
      args: [],
    );
  }

  String get loginTextFormEmail {
    return Intl.message(
      '無效的信箱格式',
      name: 'loginTextFormEmail',
      desc: '',
      args: [],
    );
  }

  String get loginTextFormPassword {
    return Intl.message(
      '密碼請包含英文大小寫',
      name: 'loginTextFormPassword',
      desc: '',
      args: [],
    );
  }

  String get loginForgetPassword {
    return Intl.message(
      '密碼請包含英文大小寫',
      name: 'loginForgetPassword',
      desc: '',
      args: [],
    );
  }

  String get loginButton {
    return Intl.message(
      '登入',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  String get loginOther {
    return Intl.message(
      '使用其他方式登入',
      name: 'loginOther',
      desc: '',
      args: [],
    );
  }

  String get loginGoogleButton {
    return Intl.message(
      'Google',
      name: 'loginGoogleButton',
      desc: '',
      args: [],
    );
  }

  String get loginFacebookButton {
    return Intl.message(
      'Facebook',
      name: 'loginFacebookButton',
      desc: '',
      args: [],
    );
  }

  String get loginForgotPassword {
    return Intl.message(
      '忘記密碼?',
      name: 'loginForgotPassword',
      desc: '',
      args: [],
    );
  }

  String get loginNoAccount {
    return Intl.message(
      '沒有帳號密碼?',
      name: 'loginNoAccount',
      desc: '',
      args: [],
    );
  }

  String get loginSignIn {
    return Intl.message(
      '立即註冊',
      name: 'loginSignIn',
      desc: '',
      args: [],
    );
  }

  String get homeAppbar {
    return Intl.message(
      '概覽',
      name: 'homeAppbar',
      desc: '',
      args: [],
    );
  }

  String get homeDerive {
    return Intl.message(
      '使用中裝置',
      name: 'homeDerive',
      desc: '',
      args: [],
    );
  }

  String get homeTodayMoney {
    return Intl.message(
      '今日總花費',
      name: 'homeTodayMoney',
      desc: '',
      args: [],
    );
  }

  String get homeElectricCharge {
    return Intl.message(
      '目前電價',
      name: 'homeElectricCharge',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}