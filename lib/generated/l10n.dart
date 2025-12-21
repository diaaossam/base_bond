// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Error during communication`
  String get error_fetch_data {
    return Intl.message(
      'Error during communication',
      name: 'error_fetch_data',
      desc: '',
      args: [],
    );
  }

  /// `Bad Request`
  String get error_bad_request {
    return Intl.message(
      'Bad Request',
      name: 'error_bad_request',
      desc: '',
      args: [],
    );
  }

  /// `Bad response from server`
  String get error_bad_response {
    return Intl.message(
      'Bad response from server',
      name: 'error_bad_response',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized access`
  String get error_unauthorized {
    return Intl.message(
      'Unauthorized access',
      name: 'error_unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Not Found`
  String get error_not_found {
    return Intl.message(
      'Not Found',
      name: 'error_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Conflict occurred`
  String get error_conflict {
    return Intl.message(
      'Conflict occurred',
      name: 'error_conflict',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error`
  String get error_internal_server {
    return Intl.message(
      'Internal server error',
      name: 'error_internal_server',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get error_no_internet {
    return Intl.message(
      'No internet connection',
      name: 'error_no_internet',
      desc: '',
      args: [],
    );
  }

  /// `No Data Found , please try again later`
  String get noData {
    return Intl.message(
      'No Data Found , please try again later',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Pick video`
  String get pickVideo {
    return Intl.message('Pick video', name: 'pickVideo', desc: '', args: []);
  }

  /// `Pick Image`
  String get pickImage {
    return Intl.message('Pick Image', name: 'pickImage', desc: '', args: []);
  }

  /// `Choose Image`
  String get chooseFromGallery1 {
    return Intl.message(
      'Choose Image',
      name: 'chooseFromGallery1',
      desc: '',
      args: [],
    );
  }

  /// `Choose video`
  String get chooseFromGallery2 {
    return Intl.message(
      'Choose video',
      name: 'chooseFromGallery2',
      desc: '',
      args: [],
    );
  }

  /// `Choose From Gallery`
  String get chooseFromGallery {
    return Intl.message(
      'Choose From Gallery',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `There is An Error`
  String get thereIsError {
    return Intl.message(
      'There is An Error',
      name: 'thereIsError',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Search ... `
  String get searchHint {
    return Intl.message('Search ... ', name: 'searchHint', desc: '', args: []);
  }

  /// `Update Available`
  String get updateTitle {
    return Intl.message(
      'Update Available',
      name: 'updateTitle',
      desc: '',
      args: [],
    );
  }

  /// `A new version of the app has been released with important improvements and fixes.`
  String get updateBody {
    return Intl.message(
      'A new version of the app has been released with important improvements and fixes.',
      name: 'updateBody',
      desc: '',
      args: [],
    );
  }

  /// `Faster performance and UI enhancements.`
  String get updateBody1 {
    return Intl.message(
      'Faster performance and UI enhancements.',
      name: 'updateBody1',
      desc: '',
      args: [],
    );
  }

  /// `Bug fixes.`
  String get updateBody2 {
    return Intl.message('Bug fixes.', name: 'updateBody2', desc: '', args: []);
  }

  /// `Update Now`
  String get updateBody3 {
    return Intl.message('Update Now', name: 'updateBody3', desc: '', args: []);
  }

  /// `Easier Shopping`
  String get boardingTitle1 {
    return Intl.message(
      'Easier Shopping',
      name: 'boardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Discover thousands of products and choose what suits you quickly and easily from anywhere.`
  String get boardingDescription1 {
    return Intl.message(
      'Discover thousands of products and choose what suits you quickly and easily from anywhere.',
      name: 'boardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Daily Deals`
  String get boardingTitle2 {
    return Intl.message(
      'Daily Deals',
      name: 'boardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Don’t miss the strongest discounts and exclusive offers that get updated every day.`
  String get boardingDescription2 {
    return Intl.message(
      'Don’t miss the strongest discounts and exclusive offers that get updated every day.',
      name: 'boardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Secure Payment & Fast Delivery`
  String get boardingTitle3 {
    return Intl.message(
      'Secure Payment & Fast Delivery',
      name: 'boardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Pay safely and enjoy fast delivery right to your doorstep without any hassle.`
  String get boardingDescription3 {
    return Intl.message(
      'Pay safely and enjoy fast delivery right to your doorstep without any hassle.',
      name: 'boardingDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message('Start Now', name: 'startNow', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get validation {
    return Intl.message(
      'This field is required',
      name: 'validation',
      desc: '',
      args: [],
    );
  }

  /// `سعداء بانضمامك!`
  String get registerTitle {
    return Intl.message(
      'سعداء بانضمامك!',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `خطوات سريعة فقط… لتبدأ رحلتك معنا`
  String get registerBody {
    return Intl.message(
      'خطوات سريعة فقط… لتبدأ رحلتك معنا',
      name: 'registerBody',
      desc: '',
      args: [],
    );
  }

  /// `سعداء بعودتك من جديد !`
  String get loginTitle {
    return Intl.message(
      'سعداء بعودتك من جديد !',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `أدخل رقم هاتفك لتسجيل الدخول`
  String get loginBody {
    return Intl.message(
      'أدخل رقم هاتفك لتسجيل الدخول',
      name: 'loginBody',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login {
    return Intl.message('تسجيل الدخول', name: 'login', desc: '', args: []);
  }

  /// `تسجيل`
  String get register {
    return Intl.message('تسجيل', name: 'register', desc: '', args: []);
  }

  /// `إنشاء حساب جديد`
  String get createNewAccount {
    return Intl.message(
      'إنشاء حساب جديد',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `الدخول كزائر`
  String get loginAsGuest {
    return Intl.message(
      'الدخول كزائر',
      name: 'loginAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `ليس لديك حساب !`
  String get dontHaveAccount {
    return Intl.message(
      'ليس لديك حساب !',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `لديك حساب !`
  String get alreadyHaveAccount {
    return Intl.message(
      'لديك حساب !',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `أو`
  String get or {
    return Intl.message('أو', name: 'or', desc: '', args: []);
  }

  /// `لم يصلك الرمز ؟`
  String get dontReceiveCode {
    return Intl.message(
      'لم يصلك الرمز ؟',
      name: 'dontReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `إعاده الإرسال`
  String get resendCode {
    return Intl.message(
      'إعاده الإرسال',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `أدخل رمز التحقق (OTP)`
  String get otpTitle {
    return Intl.message(
      'أدخل رمز التحقق (OTP)',
      name: 'otpTitle',
      desc: '',
      args: [],
    );
  }

  /// `قمنا بإرسال رمز مُكوّن من 4 أرقام إلى رقم هاتفك`
  String get otpBody {
    return Intl.message(
      'قمنا بإرسال رمز مُكوّن من 4 أرقام إلى رقم هاتفك',
      name: 'otpBody',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد`
  String get confirm {
    return Intl.message('تأكيد', name: 'confirm', desc: '', args: []);
  }

  /// `الاسم الكامل`
  String get fullName {
    return Intl.message('الاسم الكامل', name: 'fullName', desc: '', args: []);
  }

  /// `المحافظة`
  String get governorate {
    return Intl.message('المحافظة', name: 'governorate', desc: '', args: []);
  }

  /// `المنطقة`
  String get region {
    return Intl.message('المنطقة', name: 'region', desc: '', args: []);
  }

  /// `جارى التحميل`
  String get loading {
    return Intl.message('جارى التحميل', name: 'loading', desc: '', args: []);
  }

  /// `الرئيسية`
  String get home {
    return Intl.message('الرئيسية', name: 'home', desc: '', args: []);
  }

  /// `السلة`
  String get cart {
    return Intl.message('السلة', name: 'cart', desc: '', args: []);
  }

  /// `طلباتى`
  String get myOrders {
    return Intl.message('طلباتى', name: 'myOrders', desc: '', args: []);
  }

  /// `المفضلة`
  String get favorites {
    return Intl.message('المفضلة', name: 'favorites', desc: '', args: []);
  }

  /// `الإعدادات`
  String get settings {
    return Intl.message('الإعدادات', name: 'settings', desc: '', args: []);
  }

  /// `التصنيفات`
  String get categories {
    return Intl.message('التصنيفات', name: 'categories', desc: '', args: []);
  }

  /// `تسجيل الدخول عبر جوجل`
  String get loginViaGoogle {
    return Intl.message(
      'تسجيل الدخول عبر جوجل',
      name: 'loginViaGoogle',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول عبر أبل`
  String get loginViaApple {
    return Intl.message(
      'تسجيل الدخول عبر أبل',
      name: 'loginViaApple',
      desc: '',
      args: [],
    );
  }

  /// `رؤية المزيد`
  String get seeAll {
    return Intl.message('رؤية المزيد', name: 'seeAll', desc: '', args: []);
  }

  /// `الأكثر مبيعاً`
  String get bestSellers {
    return Intl.message(
      'الأكثر مبيعاً',
      name: 'bestSellers',
      desc: '',
      args: [],
    );
  }

  /// `وصل حديثاً`
  String get newArrivals {
    return Intl.message('وصل حديثاً', name: 'newArrivals', desc: '', args: []);
  }

  /// `موصي بها`
  String get recommendedProducts {
    return Intl.message(
      'موصي بها',
      name: 'recommendedProducts',
      desc: '',
      args: [],
    );
  }

  /// `جميع الأقسام`
  String get allCategories {
    return Intl.message(
      'جميع الأقسام',
      name: 'allCategories',
      desc: '',
      args: [],
    );
  }

  /// `ج.م`
  String get egp {
    return Intl.message('ج.م', name: 'egp', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
