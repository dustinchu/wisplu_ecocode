// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `嗨TW`
  String get simpleText {
    return Intl.message(
      '嗨TW',
      name: 'simpleText',
      desc: '',
      args: [],
    );
  }

  /// `登入中.....`
  String get loging {
    return Intl.message(
      '登入中.....',
      name: 'loging',
      desc: '',
      args: [],
    );
  }

  /// `登入成功`
  String get loginTrue {
    return Intl.message(
      '登入成功',
      name: 'loginTrue',
      desc: '',
      args: [],
    );
  }

  /// `登入發生錯誤`
  String get loginFalse {
    return Intl.message(
      '登入發生錯誤',
      name: 'loginFalse',
      desc: '',
      args: [],
    );
  }

  /// `無效的信箱格式`
  String get loginTextFormEmail {
    return Intl.message(
      '無效的信箱格式',
      name: 'loginTextFormEmail',
      desc: '',
      args: [],
    );
  }

  /// `密碼請包含英文大小寫`
  String get loginTextFormPassword {
    return Intl.message(
      '密碼請包含英文大小寫',
      name: 'loginTextFormPassword',
      desc: '',
      args: [],
    );
  }

  /// `密碼請包含英文大小寫`
  String get loginForgetPassword {
    return Intl.message(
      '密碼請包含英文大小寫',
      name: 'loginForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `登入`
  String get loginButton {
    return Intl.message(
      '登入',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `使用其他方式登入`
  String get loginOther {
    return Intl.message(
      '使用其他方式登入',
      name: 'loginOther',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get loginGoogleButton {
    return Intl.message(
      'Google',
      name: 'loginGoogleButton',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get loginFacebookButton {
    return Intl.message(
      'Facebook',
      name: 'loginFacebookButton',
      desc: '',
      args: [],
    );
  }

  /// `忘記密碼?`
  String get loginForgotPassword {
    return Intl.message(
      '忘記密碼?',
      name: 'loginForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `沒有帳號密碼?`
  String get loginNoAccount {
    return Intl.message(
      '沒有帳號密碼?',
      name: 'loginNoAccount',
      desc: '',
      args: [],
    );
  }

  /// `立即註冊`
  String get loginSignIn {
    return Intl.message(
      '立即註冊',
      name: 'loginSignIn',
      desc: '',
      args: [],
    );
  }

  /// `概覽`
  String get homeAppbar {
    return Intl.message(
      '概覽',
      name: 'homeAppbar',
      desc: '',
      args: [],
    );
  }

  /// `使用中裝置`
  String get homeDerive {
    return Intl.message(
      '使用中裝置',
      name: 'homeDerive',
      desc: '',
      args: [],
    );
  }

  /// `今日總花費`
  String get homeTodayMoney {
    return Intl.message(
      '今日總花費',
      name: 'homeTodayMoney',
      desc: '',
      args: [],
    );
  }

  /// `目前電價`
  String get homeElectricCharge {
    return Intl.message(
      '目前電價',
      name: 'homeElectricCharge',
      desc: '',
      args: [],
    );
  }

  /// `概覽`
  String get deviceMenuButton {
    return Intl.message(
      '概覽',
      name: 'deviceMenuButton',
      desc: '',
      args: [],
    );
  }

  /// `周趨勢`
  String get deviceChartButton {
    return Intl.message(
      '周趨勢',
      name: 'deviceChartButton',
      desc: '',
      args: [],
    );
  }

  /// `總金額`
  String get deviceCircleTotleMoney {
    return Intl.message(
      '總金額',
      name: 'deviceCircleTotleMoney',
      desc: '',
      args: [],
    );
  }

  /// `信箱`
  String get emailForm {
    return Intl.message(
      '信箱',
      name: 'emailForm',
      desc: '',
      args: [],
    );
  }

  /// `密碼`
  String get passwordForm {
    return Intl.message(
      '密碼',
      name: 'passwordForm',
      desc: '',
      args: [],
    );
  }

  /// `註冊`
  String get registerTitle {
    return Intl.message(
      '註冊',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `註冊失敗`
  String get registrationFailure {
    return Intl.message(
      '註冊失敗',
      name: 'registrationFailure',
      desc: '',
      args: [],
    );
  }

  /// `註冊...`
  String get registration {
    return Intl.message(
      '註冊...',
      name: 'registration',
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