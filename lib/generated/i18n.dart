import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_brace_in_string_interps

//WARNING: This file is automatically generated. DO NOT EDIT, all your changes would be lost.

typedef LocaleChangeCallback = void Function(Locale locale);

class I18n implements WidgetsLocalizations {
  const I18n();
  static Locale? _locale;
  static bool _shouldReload = false;

  static set locale(Locale newLocale) {
    _shouldReload = true;
    I18n._locale = newLocale;
  }

  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();

  /// function to be invoked when changing the language
  static LocaleChangeCallback? onLocaleChanged;

  static I18n of(BuildContext context) =>
      Localizations.of<I18n>(context, WidgetsLocalizations)!;

  @override
  TextDirection get textDirection => TextDirection.ltr;

  /// "Login means that you agree to the User Agreement & Privacy Policy"
  String get tvPrivacyPolicy =>
      "Login means that you agree to the User Agreement & Privacy Policy";

  /// "Other Login"
  String get otherLogin => "Other Login";
}

class _I18n_en_US extends I18n {
  const _I18n_en_US();

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_zh_CN extends I18n {
  const _I18n_zh_CN();

  /// "Login berarti Anda setuju dengan User Agreement & Privacy Policy."
  @override
  String get tvPrivacyPolicy =>
      "Login berarti Anda setuju dengan User Agreement & Privacy Policy.";

  /// "其他登陆"
  @override
  String get otherLogin => "其他登陆";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_id_ID extends I18n {
  const _I18n_id_ID();

  /// "Login berarti Anda setuju dengan User Agreement & Privacy Policy."
  @override
  String get tvPrivacyPolicy =>
      "Login berarti Anda setuju dengan User Agreement & Privacy Policy.";

  /// "Other Login"
  @override
  String get otherLogin => "Other Login";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_ms_MY extends I18n {
  const _I18n_ms_MY();

  /// "Login berarti Anda setuju dengan User Agreement & Privacy Policy."
  @override
  String get tvPrivacyPolicy =>
      "Login berarti Anda setuju dengan User Agreement & Privacy Policy.";

  /// "Other Login"
  @override
  String get otherLogin => "Other Login";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_ar_SA extends I18n {
  const _I18n_ar_SA();

  /// "Login means that you agree to the User Agreement & Privacy Policy"
  @override
  String get tvPrivacyPolicy =>
      "Login means that you agree to the User Agreement & Privacy Policy";

  /// "Other Login"
  @override
  String get otherLogin => "Other Login";

  @override
  TextDirection get textDirection => TextDirection.rtl;
}

class _I18n_vi_VN extends I18n {
  const _I18n_vi_VN();

  /// "Login berarti Anda setuju dengan User Agreement & Privacy Policy."
  @override
  String get tvPrivacyPolicy =>
      "Login berarti Anda setuju dengan User Agreement & Privacy Policy.";

  /// "Other Login"
  @override
  String get otherLogin => "Other Login";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_pt_PT extends I18n {
  const _I18n_pt_PT();

  /// "Login berarti Anda setuju dengan User Agreement & Privacy Policy."
  @override
  String get tvPrivacyPolicy =>
      "Login berarti Anda setuju dengan User Agreement & Privacy Policy.";

  /// "Other Login"
  @override
  String get otherLogin => "Other Login";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class GeneratedLocalizationsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", "US"),
      Locale("zh", "CN"),
      Locale("id", "ID"),
      Locale("ms", "MY"),
      Locale("ar", "SA"),
      Locale("vi", "VN"),
      Locale("pt", "PT")
    ];
  }

  LocaleResolutionCallback resolution({Locale? fallback}) {
    return (Locale? locale, Iterable<Locale> supported) {
      if (isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    I18n._locale ??= locale;
    I18n._shouldReload = false;
    final String lang = I18n._locale != null ? I18n._locale.toString() : "";
    final String languageCode =
        I18n._locale != null ? I18n._locale!.languageCode : "";
    if ("en_US" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    } else if ("zh_CN" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_zh_CN());
    } else if ("id_ID" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_id_ID());
    } else if ("ms_MY" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_ms_MY());
    } else if ("ar_SA" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_ar_SA());
    } else if ("vi_VN" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_vi_VN());
    } else if ("pt_PT" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_pt_PT());
    } else if ("en" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    } else if ("zh" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_zh_CN());
    } else if ("id" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_id_ID());
    } else if ("ms" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_ms_MY());
    } else if ("ar" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_ar_SA());
    } else if ("vi" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_vi_VN());
    } else if ("pt" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_pt_PT());
    }

    return SynchronousFuture<WidgetsLocalizations>(const I18n());
  }

  @override
  bool isSupported(Locale? locale) {
    for (var i = 0; i < supportedLocales.length && locale != null; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => I18n._shouldReload;
}
