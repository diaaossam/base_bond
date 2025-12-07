import 'package:bond/core/bloc/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enum/language.dart';
import '../../utils/app_strings.dart';

@Injectable()
class GlobalCubit extends Cubit<BaseState<void>> {
  final SharedPreferences sharedPreferences;

  GlobalCubit(this.sharedPreferences) : super(BaseState.initial());

  Future<void> getAppSettings() async {
    final cachedLangCode = sharedPreferences.getString(AppStrings.locale);
    final cachedTheme = sharedPreferences.getString(AppStrings.theme);
    locale = Locale(cachedLangCode ?? AppStrings.arabicCode);
    language = handleLanguageByString(code: cachedLangCode ?? "ar");
    themeMode = cachedTheme != null
        ? cachedTheme == "light"
              ? ThemeMode.light
              : ThemeMode.dark
        : ThemeMode.light;
    emit(BaseState.success(identifier: "GetAppSettings"));
  }

  ///////////////////////// App Lang ////////////////////////

  Locale locale = const Locale(AppStrings.arabicCode);
  Language language = Language.arabic;

  Future<void> changeLanguage({required Language lang}) async {
    sharedPreferences.setString(AppStrings.locale, lang.name);
    locale = Locale(lang.name);
    language = lang;
    emit(BaseState.success(identifier: "ChangeLanguage"));
  }

  //////////////////// Theme ///////////////////////

  ThemeMode themeMode = ThemeMode.light;

  void chooseAppTheme({required ThemeMode theme}) async {
    themeMode = theme;
    sharedPreferences.setString(AppStrings.theme, theme.name);
    emit(BaseState.success(identifier: "ChangeTheme"));
  }
}
