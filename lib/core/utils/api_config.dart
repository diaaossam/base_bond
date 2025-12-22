import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/location/data/models/response/my_address.dart';
import '../enum/language.dart';
import 'app_strings.dart';

class ApiConfig {
  static late Language? language;
  static late bool? isGuest;
  static late ThemeMode? themeMode;
  static late MyAddress? address;

  Future<void> init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isGuest = sharedPreferences.getBool(AppStrings.isGuest) ?? true;
    String mode =
        sharedPreferences.getString(AppStrings.theme) ?? AppStrings.light;
    String stringLanguage =
        sharedPreferences.getString(AppStrings.locale) ?? AppStrings.arabicCode;
    language = handleLanguageByString(code: stringLanguage);
    themeMode = mode == AppStrings.light ? ThemeMode.light : ThemeMode.dark;
  }
}
