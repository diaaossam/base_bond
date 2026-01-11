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

  /// `قمنا بإرسال رمز مُكوّن من 6 أرقام إلى بريدك الإلكترونى`
  String get otpBody {
    return Intl.message(
      'قمنا بإرسال رمز مُكوّن من 6 أرقام إلى بريدك الإلكترونى',
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

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Brand`
  String get brand {
    return Intl.message('Brand', name: 'brand', desc: '', args: []);
  }

  /// `Price Range`
  String get priceRange {
    return Intl.message('Price Range', name: 'priceRange', desc: '', args: []);
  }

  /// `From`
  String get from {
    return Intl.message('From', name: 'from', desc: '', args: []);
  }

  /// `To`
  String get to {
    return Intl.message('To', name: 'to', desc: '', args: []);
  }

  /// `Sort By`
  String get sortBy {
    return Intl.message('Sort By', name: 'sortBy', desc: '', args: []);
  }

  /// `Select Sort Method`
  String get selectSortMethod {
    return Intl.message(
      'Select Sort Method',
      name: 'selectSortMethod',
      desc: '',
      args: [],
    );
  }

  /// `Special Options`
  String get specialOptions {
    return Intl.message(
      'Special Options',
      name: 'specialOptions',
      desc: '',
      args: [],
    );
  }

  /// `Featured`
  String get featured {
    return Intl.message('Featured', name: 'featured', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Apply Filter`
  String get applyFilter {
    return Intl.message(
      'Apply Filter',
      name: 'applyFilter',
      desc: '',
      args: [],
    );
  }

  /// `Price: Low to High`
  String get sortPriceAsc {
    return Intl.message(
      'Price: Low to High',
      name: 'sortPriceAsc',
      desc: '',
      args: [],
    );
  }

  /// `Price: High to Low`
  String get sortPriceDesc {
    return Intl.message(
      'Price: High to Low',
      name: 'sortPriceDesc',
      desc: '',
      args: [],
    );
  }

  /// `Newest`
  String get sortNewest {
    return Intl.message('Newest', name: 'sortNewest', desc: '', args: []);
  }

  /// `Oldest`
  String get sortOldest {
    return Intl.message('Oldest', name: 'sortOldest', desc: '', args: []);
  }

  /// `Most Popular`
  String get sortPopular {
    return Intl.message(
      'Most Popular',
      name: 'sortPopular',
      desc: '',
      args: [],
    );
  }

  /// `تعديل`
  String get edit {
    return Intl.message('تعديل', name: 'edit', desc: '', args: []);
  }

  /// `لديك`
  String get youHave {
    return Intl.message('لديك', name: 'youHave', desc: '', args: []);
  }

  /// `نقطة`
  String get point {
    return Intl.message('نقطة', name: 'point', desc: '', args: []);
  }

  /// `استخدم هذا الكود لإستخدام نقاطك`
  String get pointHint {
    return Intl.message(
      'استخدم هذا الكود لإستخدام نقاطك',
      name: 'pointHint',
      desc: '',
      args: [],
    );
  }

  /// `نسخ`
  String get copy {
    return Intl.message('نسخ', name: 'copy', desc: '', args: []);
  }

  /// `نقاطي`
  String get myPoints {
    return Intl.message('نقاطي', name: 'myPoints', desc: '', args: []);
  }

  /// `الإشعارات`
  String get notifications {
    return Intl.message('الإشعارات', name: 'notifications', desc: '', args: []);
  }

  /// `شروط الخصوصية`
  String get privacyPolicy {
    return Intl.message(
      'شروط الخصوصية',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `سياسة الإستخدام`
  String get termsAndCon {
    return Intl.message(
      'سياسة الإستخدام',
      name: 'termsAndCon',
      desc: '',
      args: [],
    );
  }

  /// `اللغة`
  String get language {
    return Intl.message('اللغة', name: 'language', desc: '', args: []);
  }

  /// `اختر لغة التطبيق المفضلة`
  String get languageHint {
    return Intl.message(
      'اختر لغة التطبيق المفضلة',
      name: 'languageHint',
      desc: '',
      args: [],
    );
  }

  /// `الوضع الليلي`
  String get darkMode {
    return Intl.message('الوضع الليلي', name: 'darkMode', desc: '', args: []);
  }

  /// `الوضع النهارى`
  String get lightMode {
    return Intl.message('الوضع النهارى', name: 'lightMode', desc: '', args: []);
  }

  /// `الوضع`
  String get mode {
    return Intl.message('الوضع', name: 'mode', desc: '', args: []);
  }

  /// `الدعم الفني`
  String get customerSupport {
    return Intl.message(
      'الدعم الفني',
      name: 'customerSupport',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get logOut {
    return Intl.message('تسجيل الخروج', name: 'logOut', desc: '', args: []);
  }

  /// `تفاصيل المنتج`
  String get productDetails {
    return Intl.message(
      'تفاصيل المنتج',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `الوصف`
  String get description {
    return Intl.message('الوصف', name: 'description', desc: '', args: []);
  }

  /// `لا يوجد وصف متاح`
  String get noDescription {
    return Intl.message(
      'لا يوجد وصف متاح',
      name: 'noDescription',
      desc: '',
      args: [],
    );
  }

  /// `عرض المزيد`
  String get showMore {
    return Intl.message('عرض المزيد', name: 'showMore', desc: '', args: []);
  }

  /// `عرض أقل`
  String get showLess {
    return Intl.message('عرض أقل', name: 'showLess', desc: '', args: []);
  }

  /// `خصم`
  String get discount {
    return Intl.message('خصم', name: 'discount', desc: '', args: []);
  }

  /// `Product Information`
  String get productInfo {
    return Intl.message(
      'Product Information',
      name: 'productInfo',
      desc: '',
      args: [],
    );
  }

  /// `SKU`
  String get sku {
    return Intl.message('SKU', name: 'sku', desc: '', args: []);
  }

  /// `Not Available`
  String get notAvailable {
    return Intl.message(
      'Not Available',
      name: 'notAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message('Weight', name: 'weight', desc: '', args: []);
  }

  /// `kg`
  String get kg {
    return Intl.message('kg', name: 'kg', desc: '', args: []);
  }

  /// `Dimensions`
  String get dimensions {
    return Intl.message('Dimensions', name: 'dimensions', desc: '', args: []);
  }

  /// `cm`
  String get cm {
    return Intl.message('cm', name: 'cm', desc: '', args: []);
  }

  /// `Stock`
  String get stock {
    return Intl.message('Stock', name: 'stock', desc: '', args: []);
  }

  /// `Available`
  String get available {
    return Intl.message('Available', name: 'available', desc: '', args: []);
  }

  /// `تحت المراجعة`
  String get underReview {
    return Intl.message(
      'تحت المراجعة',
      name: 'underReview',
      desc: '',
      args: [],
    );
  }

  /// `تم التأكيد`
  String get confirmed {
    return Intl.message('تم التأكيد', name: 'confirmed', desc: '', args: []);
  }

  /// `تحت المعالجة`
  String get inProgress {
    return Intl.message('تحت المعالجة', name: 'inProgress', desc: '', args: []);
  }

  /// `خرج للتوصيل`
  String get outForDeleivery {
    return Intl.message(
      'خرج للتوصيل',
      name: 'outForDeleivery',
      desc: '',
      args: [],
    );
  }

  /// `مسترجع`
  String get returns {
    return Intl.message('مسترجع', name: 'returns', desc: '', args: []);
  }

  /// `تم التوصيل`
  String get deleiverd {
    return Intl.message('تم التوصيل', name: 'deleiverd', desc: '', args: []);
  }

  /// `ملغي`
  String get canceled {
    return Intl.message('ملغي', name: 'canceled', desc: '', args: []);
  }

  /// `إضافة إلي السلة`
  String get addToCart {
    return Intl.message(
      'إضافة إلي السلة',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `الذهاب إلي السلة`
  String get goToCart {
    return Intl.message(
      'الذهاب إلي السلة',
      name: 'goToCart',
      desc: '',
      args: [],
    );
  }

  /// `العنوان`
  String get address {
    return Intl.message('العنوان', name: 'address', desc: '', args: []);
  }

  /// `العنوان علي الخريطة`
  String get locationOnMap {
    return Intl.message(
      'العنوان علي الخريطة',
      name: 'locationOnMap',
      desc: '',
      args: [],
    );
  }

  /// `إضافة عنوان جديد`
  String get addNewAddress {
    return Intl.message(
      'إضافة عنوان جديد',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `حفظ العنوان`
  String get saveLocation {
    return Intl.message(
      'حفظ العنوان',
      name: 'saveLocation',
      desc: '',
      args: [],
    );
  }

  /// `تم حفظ العنوان بنجاح`
  String get locationPickedSuccessFully {
    return Intl.message(
      'تم حفظ العنوان بنجاح',
      name: 'locationPickedSuccessFully',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد عناوين محفوظة`
  String get noLocation {
    return Intl.message(
      'لا توجد عناوين محفوظة',
      name: 'noLocation',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكترونى`
  String get email {
    return Intl.message('البريد الإلكترونى', name: 'email', desc: '', args: []);
  }

  /// `الكمية المتاحة فقط `
  String get availableQuantity {
    return Intl.message(
      'الكمية المتاحة فقط ',
      name: 'availableQuantity',
      desc: '',
      args: [],
    );
  }

  /// `نقدي`
  String get cash {
    return Intl.message('نقدي', name: 'cash', desc: '', args: []);
  }

  /// `بطاقة إلكترونية`
  String get visa {
    return Intl.message('بطاقة إلكترونية', name: 'visa', desc: '', args: []);
  }

  /// `Order Placed Successfully`
  String get orderPlacedSuccess {
    return Intl.message(
      'Order Placed Successfully',
      name: 'orderPlacedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Thank you! Your order has been received and will be processed soon`
  String get orderPlacedSuccess2 {
    return Intl.message(
      'Thank you! Your order has been received and will be processed soon',
      name: 'orderPlacedSuccess2',
      desc: '',
      args: [],
    );
  }

  /// `Track Order`
  String get trackOrder {
    return Intl.message('Track Order', name: 'trackOrder', desc: '', args: []);
  }

  /// `Do you have a discount code?`
  String get doYouHaveDiscount {
    return Intl.message(
      'Do you have a discount code?',
      name: 'doYouHaveDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Enter discount code`
  String get doYouHaveDiscountHint {
    return Intl.message(
      'Enter discount code',
      name: 'doYouHaveDiscountHint',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Discount applied successfully`
  String get discountApplied {
    return Intl.message(
      'Discount applied successfully',
      name: 'discountApplied',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Add Delivery Address`
  String get addAddressDeleivery {
    return Intl.message(
      'Add Delivery Address',
      name: 'addAddressDeleivery',
      desc: '',
      args: [],
    );
  }

  /// `Please add a delivery address`
  String get locationValidation {
    return Intl.message(
      'Please add a delivery address',
      name: 'locationValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please select a payment method`
  String get paymentValidation {
    return Intl.message(
      'Please select a payment method',
      name: 'paymentValidation',
      desc: '',
      args: [],
    );
  }

  /// `Out of Stock`
  String get outOfStock {
    return Intl.message('Out of Stock', name: 'outOfStock', desc: '', args: []);
  }

  /// `One of the products is out of stock`
  String get outOfStock1 {
    return Intl.message(
      'One of the products is out of stock',
      name: 'outOfStock1',
      desc: '',
      args: [],
    );
  }

  /// `Place Order`
  String get placeOrder {
    return Intl.message('Place Order', name: 'placeOrder', desc: '', args: []);
  }

  /// `Confirm Order`
  String get confirmOrderTitle {
    return Intl.message(
      'Confirm Order',
      name: 'confirmOrderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to place this order?`
  String get confirmOrder {
    return Intl.message(
      'Are you sure you want to place this order?',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `قائمة المفضلة فارغة`
  String get noWithList {
    return Intl.message(
      'قائمة المفضلة فارغة',
      name: 'noWithList',
      desc: '',
      args: [],
    );
  }

  /// `Cart is empty`
  String get noCart {
    return Intl.message('Cart is empty', name: 'noCart', desc: '', args: []);
  }

  /// `سلة المشتريات الخاصه بك فارغه قم بإضافة منتجات اولاً`
  String get emptyCartHint {
    return Intl.message(
      'سلة المشتريات الخاصه بك فارغه قم بإضافة منتجات اولاً',
      name: 'emptyCartHint',
      desc: '',
      args: [],
    );
  }

  /// `قائمة المنتجات الفضلة الخاصه بك فارغه قم بإضافة منتجات اولاً`
  String get emptyWishHint {
    return Intl.message(
      'قائمة المنتجات الفضلة الخاصه بك فارغه قم بإضافة منتجات اولاً',
      name: 'emptyWishHint',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentType {
    return Intl.message(
      'Payment Method',
      name: 'paymentType',
      desc: '',
      args: [],
    );
  }

  /// `Invoice`
  String get invoice {
    return Intl.message('Invoice', name: 'invoice', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Shipping Cost`
  String get shippingCost {
    return Intl.message(
      'Shipping Cost',
      name: 'shippingCost',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get totalPrice {
    return Intl.message('Total Price', name: 'totalPrice', desc: '', args: []);
  }

  /// `Free Delivery`
  String get freeDeleivery {
    return Intl.message(
      'Free Delivery',
      name: 'freeDeleivery',
      desc: '',
      args: [],
    );
  }

  /// `You will get`
  String get youWillWin {
    return Intl.message('You will get', name: 'youWillWin', desc: '', args: []);
  }

  /// `points`
  String get youWillWin2 {
    return Intl.message('points', name: 'youWillWin2', desc: '', args: []);
  }

  /// `Click to replace points`
  String get clickToReplacePoints {
    return Intl.message(
      'Click to replace points',
      name: 'clickToReplacePoints',
      desc: '',
      args: [],
    );
  }

  /// `Add Note`
  String get addNote {
    return Intl.message('Add Note', name: 'addNote', desc: '', args: []);
  }

  /// `Add a note to the order`
  String get addNoteHint {
    return Intl.message(
      'Add a note to the order',
      name: 'addNoteHint',
      desc: '',
      args: [],
    );
  }

  /// `IQD`
  String get iqd {
    return Intl.message('IQD', name: 'iqd', desc: '', args: []);
  }

  /// `My Addresses`
  String get myAddresses {
    return Intl.message(
      'My Addresses',
      name: 'myAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Edit Address`
  String get editAddress {
    return Intl.message(
      'Edit Address',
      name: 'editAddress',
      desc: '',
      args: [],
    );
  }

  /// `Delete Address`
  String get deleteAddress {
    return Intl.message(
      'Delete Address',
      name: 'deleteAddress',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this address?`
  String get deleteAddressConfirm {
    return Intl.message(
      'Are you sure you want to delete this address?',
      name: 'deleteAddressConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Address Name`
  String get addressName {
    return Intl.message(
      'Address Name',
      name: 'addressName',
      desc: '',
      args: [],
    );
  }

  /// `Address Details`
  String get addressDetails {
    return Intl.message(
      'Address Details',
      name: 'addressDetails',
      desc: '',
      args: [],
    );
  }

  /// `Additional Notes`
  String get additionalNotes {
    return Intl.message(
      'Additional Notes',
      name: 'additionalNotes',
      desc: '',
      args: [],
    );
  }

  /// `Set as Default`
  String get makeDefault {
    return Intl.message(
      'Set as Default',
      name: 'makeDefault',
      desc: '',
      args: [],
    );
  }

  /// `Default Address`
  String get defaultAddress {
    return Intl.message(
      'Default Address',
      name: 'defaultAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address saved successfully`
  String get addressSaved {
    return Intl.message(
      'Address saved successfully',
      name: 'addressSaved',
      desc: '',
      args: [],
    );
  }

  /// `Address updated successfully`
  String get addressUpdated {
    return Intl.message(
      'Address updated successfully',
      name: 'addressUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Address deleted successfully`
  String get addressDeleted {
    return Intl.message(
      'Address deleted successfully',
      name: 'addressDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Select Province`
  String get selectProvince {
    return Intl.message(
      'Select Province',
      name: 'selectProvince',
      desc: '',
      args: [],
    );
  }

  /// `Select Region`
  String get selectRegion {
    return Intl.message(
      'Select Region',
      name: 'selectRegion',
      desc: '',
      args: [],
    );
  }

  /// `Enter address details`
  String get enterAddressDetails {
    return Intl.message(
      'Enter address details',
      name: 'enterAddressDetails',
      desc: '',
      args: [],
    );
  }

  /// `Enter additional notes (optional)`
  String get enterNotes {
    return Intl.message(
      'Enter additional notes (optional)',
      name: 'enterNotes',
      desc: '',
      args: [],
    );
  }

  /// `المادة الفعالة`
  String get activeSubstance {
    return Intl.message(
      'المادة الفعالة',
      name: 'activeSubstance',
      desc: '',
      args: [],
    );
  }

  /// `Active Substances`
  String get activeSubstances {
    return Intl.message(
      'Active Substances',
      name: 'activeSubstances',
      desc: '',
      args: [],
    );
  }

  /// `All Active Substances`
  String get allActiveSubstances {
    return Intl.message(
      'All Active Substances',
      name: 'allActiveSubstances',
      desc: '',
      args: [],
    );
  }

  /// `هل أنت متأكد أنك تريد تسجيل الخروج؟`
  String get logoutBody {
    return Intl.message(
      'هل أنت متأكد أنك تريد تسجيل الخروج؟',
      name: 'logoutBody',
      desc: '',
      args: [],
    );
  }

  /// `جاري التحميل...`
  String get loadingText {
    return Intl.message(
      'جاري التحميل...',
      name: 'loadingText',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد طلبات`
  String get noOrdersFound {
    return Intl.message(
      'لا توجد طلبات',
      name: 'noOrdersFound',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ ما`
  String get somethingWentWrong {
    return Intl.message(
      'حدث خطأ ما',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `التفاصيل`
  String get details {
    return Intl.message('التفاصيل', name: 'details', desc: '', args: []);
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Rate Product`
  String get rateProduct {
    return Intl.message(
      'Rate Product',
      name: 'rateProduct',
      desc: '',
      args: [],
    );
  }

  /// `Hide Rating`
  String get hideRating {
    return Intl.message('Hide Rating', name: 'hideRating', desc: '', args: []);
  }

  /// `Submit Rating`
  String get submitRating {
    return Intl.message(
      'Submit Rating',
      name: 'submitRating',
      desc: '',
      args: [],
    );
  }

  /// `Add a comment (optional)`
  String get addComment {
    return Intl.message(
      'Add a comment (optional)',
      name: 'addComment',
      desc: '',
      args: [],
    );
  }

  /// `Rated`
  String get rated {
    return Intl.message('Rated', name: 'rated', desc: '', args: []);
  }

  /// `Please select a rating`
  String get pleaseSelectRating {
    return Intl.message(
      'Please select a rating',
      name: 'pleaseSelectRating',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for rating!`
  String get thankYouForRating {
    return Intl.message(
      'Thank you for rating!',
      name: 'thankYouForRating',
      desc: '',
      args: [],
    );
  }

  /// `Error submitting rating`
  String get ratingError {
    return Intl.message(
      'Error submitting rating',
      name: 'ratingError',
      desc: '',
      args: [],
    );
  }

  /// `Current`
  String get currentStatus {
    return Intl.message('Current', name: 'currentStatus', desc: '', args: []);
  }

  /// `Reviewing your order`
  String get reviewingOrder {
    return Intl.message(
      'Reviewing your order',
      name: 'reviewingOrder',
      desc: '',
      args: [],
    );
  }

  /// `Your order is confirmed and being prepared`
  String get orderConfirmed {
    return Intl.message(
      'Your order is confirmed and being prepared',
      name: 'orderConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Preparing your order`
  String get preparingOrder {
    return Intl.message(
      'Preparing your order',
      name: 'preparingOrder',
      desc: '',
      args: [],
    );
  }

  /// `Your order is on the way`
  String get orderOnTheWay {
    return Intl.message(
      'Your order is on the way',
      name: 'orderOnTheWay',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been delivered`
  String get orderDelivered {
    return Intl.message(
      'Your order has been delivered',
      name: 'orderDelivered',
      desc: '',
      args: [],
    );
  }

  /// `Order has been canceled`
  String get orderCanceled {
    return Intl.message(
      'Order has been canceled',
      name: 'orderCanceled',
      desc: '',
      args: [],
    );
  }

  /// `Order has been returned`
  String get orderReturned {
    return Intl.message(
      'Order has been returned',
      name: 'orderReturned',
      desc: '',
      args: [],
    );
  }

  /// `Go to Home`
  String get goToHome {
    return Intl.message('Go to Home', name: 'goToHome', desc: '', args: []);
  }

  /// `إلغاء الطلب`
  String get cancelOrder {
    return Intl.message('إلغاء الطلب', name: 'cancelOrder', desc: '', args: []);
  }

  /// `هل أنت متأكد من إلغاء الطلب ؟`
  String get cancelOrderConfirm {
    return Intl.message(
      'هل أنت متأكد من إلغاء الطلب ؟',
      name: 'cancelOrderConfirm',
      desc: '',
      args: [],
    );
  }

  /// `مرحباً بك`
  String get welcome {
    return Intl.message('مرحباً بك', name: 'welcome', desc: '', args: []);
  }

  /// `لا توجد إشعارات`
  String get noNotificationTitle {
    return Intl.message(
      'لا توجد إشعارات',
      name: 'noNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `ستظهر إشعاراتك هنا عندما تصلك`
  String get noNotificationBody {
    return Intl.message(
      'ستظهر إشعاراتك هنا عندما تصلك',
      name: 'noNotificationBody',
      desc: '',
      args: [],
    );
  }

  /// `جاري مراجعة طلبك`
  String get underReview_desc {
    return Intl.message(
      'جاري مراجعة طلبك',
      name: 'underReview_desc',
      desc: '',
      args: [],
    );
  }

  /// `تم تأكيد طلبك وجاري تجهيزه`
  String get confirmed_desc {
    return Intl.message(
      'تم تأكيد طلبك وجاري تجهيزه',
      name: 'confirmed_desc',
      desc: '',
      args: [],
    );
  }

  /// `جاري تجهيز طلبك`
  String get inProgress_desc {
    return Intl.message(
      'جاري تجهيز طلبك',
      name: 'inProgress_desc',
      desc: '',
      args: [],
    );
  }

  /// `طلبك في الطريق إليك`
  String get outForDelivery_desc {
    return Intl.message(
      'طلبك في الطريق إليك',
      name: 'outForDelivery_desc',
      desc: '',
      args: [],
    );
  }

  /// `تم توصيل طلبك بنجاح`
  String get delivered_desc {
    return Intl.message(
      'تم توصيل طلبك بنجاح',
      name: 'delivered_desc',
      desc: '',
      args: [],
    );
  }

  /// `تم إرجاع الطلب`
  String get returns_desc {
    return Intl.message(
      'تم إرجاع الطلب',
      name: 'returns_desc',
      desc: '',
      args: [],
    );
  }

  /// `تم إلغاء الطلب`
  String get canceled_desc {
    return Intl.message(
      'تم إلغاء الطلب',
      name: 'canceled_desc',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Update Profile`
  String get updateProfile {
    return Intl.message(
      'Update Profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully`
  String get profileUpdated {
    return Intl.message(
      'Profile updated successfully',
      name: 'profileUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Profile Picture`
  String get profileImage {
    return Intl.message(
      'Profile Picture',
      name: 'profileImage',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInfo {
    return Intl.message(
      'Personal Information',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Change Profile Picture`
  String get changeProfilePicture {
    return Intl.message(
      'Change Profile Picture',
      name: 'changeProfilePicture',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Current Price`
  String get currentPrice {
    return Intl.message(
      'Current Price',
      name: 'currentPrice',
      desc: '',
      args: [],
    );
  }

  /// `Min Price`
  String get minPrice {
    return Intl.message('Min Price', name: 'minPrice', desc: '', args: []);
  }

  /// `Max Price`
  String get maxPrice {
    return Intl.message('Max Price', name: 'maxPrice', desc: '', args: []);
  }

  /// `Prescription Order`
  String get prescriptionOrder {
    return Intl.message(
      'Prescription Order',
      name: 'prescriptionOrder',
      desc: '',
      args: [],
    );
  }

  /// `Order your medicines easily`
  String get prescriptionTitle {
    return Intl.message(
      'Order your medicines easily',
      name: 'prescriptionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload your prescription and we'll prepare your order`
  String get prescriptionBody {
    return Intl.message(
      'Upload your prescription and we\'ll prepare your order',
      name: 'prescriptionBody',
      desc: '',
      args: [],
    );
  }

  /// `Upload Prescription`
  String get uploadPrescription {
    return Intl.message(
      'Upload Prescription',
      name: 'uploadPrescription',
      desc: '',
      args: [],
    );
  }

  /// `Tap to capture or choose from gallery`
  String get uploadPrescriptionHint {
    return Intl.message(
      'Tap to capture or choose from gallery',
      name: 'uploadPrescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Method`
  String get deliveryMethod {
    return Intl.message(
      'Delivery Method',
      name: 'deliveryMethod',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy Pickup`
  String get pharmacyPickup {
    return Intl.message(
      'Pharmacy Pickup',
      name: 'pharmacyPickup',
      desc: '',
      args: [],
    );
  }

  /// `Home Delivery`
  String get homeDelivery {
    return Intl.message(
      'Home Delivery',
      name: 'homeDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Prescription Notes`
  String get prescriptionNote {
    return Intl.message(
      'Prescription Notes',
      name: 'prescriptionNote',
      desc: '',
      args: [],
    );
  }

  /// `Add any additional notes for the pharmacist`
  String get prescriptionNoteHint {
    return Intl.message(
      'Add any additional notes for the pharmacist',
      name: 'prescriptionNoteHint',
      desc: '',
      args: [],
    );
  }

  /// `Submit Order`
  String get submitPrescription {
    return Intl.message(
      'Submit Order',
      name: 'submitPrescription',
      desc: '',
      args: [],
    );
  }

  /// `Please upload prescription image`
  String get prescriptionRequired {
    return Intl.message(
      'Please upload prescription image',
      name: 'prescriptionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been submitted successfully`
  String get prescriptionSubmitted {
    return Intl.message(
      'Your order has been submitted successfully',
      name: 'prescriptionSubmitted',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد منتجات`
  String get noProductsTitle {
    return Intl.message(
      'لا توجد منتجات',
      name: 'noProductsTitle',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد منتجات مطابقة هنا`
  String get noProductsBody {
    return Intl.message(
      'لا يوجد منتجات مطابقة هنا',
      name: 'noProductsBody',
      desc: '',
      args: [],
    );
  }

  /// `خدماتنا`
  String get ourServices {
    return Intl.message('خدماتنا', name: 'ourServices', desc: '', args: []);
  }

  /// `اطلب بالتأمين الخاص بك`
  String get orderWithYourInsurance {
    return Intl.message(
      'اطلب بالتأمين الخاص بك',
      name: 'orderWithYourInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Support Tickets`
  String get supportTickets {
    return Intl.message(
      'Support Tickets',
      name: 'supportTickets',
      desc: '',
      args: [],
    );
  }

  /// `No Support Tickets`
  String get noTicketsTitle {
    return Intl.message(
      'No Support Tickets',
      name: 'noTicketsTitle',
      desc: '',
      args: [],
    );
  }

  /// `You haven't created any support tickets yet. Tap the button below to contact our support team`
  String get noTicketsBody {
    return Intl.message(
      'You haven\'t created any support tickets yet. Tap the button below to contact our support team',
      name: 'noTicketsBody',
      desc: '',
      args: [],
    );
  }

  /// `Tap + to create a new support ticket and contact our customer service team`
  String get createTicketHint {
    return Intl.message(
      'Tap + to create a new support ticket and contact our customer service team',
      name: 'createTicketHint',
      desc: '',
      args: [],
    );
  }

  /// `Create New Ticket`
  String get createNewTicket {
    return Intl.message(
      'Create New Ticket',
      name: 'createNewTicket',
      desc: '',
      args: [],
    );
  }

  /// `Create Ticket`
  String get createTicket {
    return Intl.message(
      'Create Ticket',
      name: 'createTicket',
      desc: '',
      args: [],
    );
  }

  /// `Ticket Title`
  String get ticketTitle {
    return Intl.message(
      'Ticket Title',
      name: 'ticketTitle',
      desc: '',
      args: [],
    );
  }

  /// `Write a brief title for the issue`
  String get ticketTitleHint {
    return Intl.message(
      'Write a brief title for the issue',
      name: 'ticketTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Issue Details`
  String get ticketMessage {
    return Intl.message(
      'Issue Details',
      name: 'ticketMessage',
      desc: '',
      args: [],
    );
  }

  /// `Describe the issue in detail...`
  String get ticketMessageHint {
    return Intl.message(
      'Describe the issue in detail...',
      name: 'ticketMessageHint',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get ticketOpen {
    return Intl.message('Open', name: 'ticketOpen', desc: '', args: []);
  }

  /// `Pending`
  String get ticketPending {
    return Intl.message('Pending', name: 'ticketPending', desc: '', args: []);
  }

  /// `Closed`
  String get ticketClosed {
    return Intl.message('Closed', name: 'ticketClosed', desc: '', args: []);
  }

  /// `In Progress`
  String get ticketInProgress {
    return Intl.message(
      'In Progress',
      name: 'ticketInProgress',
      desc: '',
      args: [],
    );
  }

  /// `View Conversation`
  String get viewConversation {
    return Intl.message(
      'View Conversation',
      name: 'viewConversation',
      desc: '',
      args: [],
    );
  }

  /// `Start Conversation`
  String get startConversation {
    return Intl.message(
      'Start Conversation',
      name: 'startConversation',
      desc: '',
      args: [],
    );
  }

  /// `Write your message to contact support team`
  String get startConversationHint {
    return Intl.message(
      'Write your message to contact support team',
      name: 'startConversationHint',
      desc: '',
      args: [],
    );
  }

  /// `Type your message...`
  String get typeMessage {
    return Intl.message(
      'Type your message...',
      name: 'typeMessage',
      desc: '',
      args: [],
    );
  }

  /// `فريق الدعم`
  String get supportTeam {
    return Intl.message('فريق الدعم', name: 'supportTeam', desc: '', args: []);
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message('كلمة المرور', name: 'password', desc: '', args: []);
  }

  /// `تأكيد كلمة المرور`
  String get passwordConfirmation {
    return Intl.message(
      'تأكيد كلمة المرور',
      name: 'passwordConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور وتأكيد كلمة المرور غير متطابقتين`
  String get passwordValidation {
    return Intl.message(
      'كلمة المرور وتأكيد كلمة المرور غير متطابقتين',
      name: 'passwordValidation',
      desc: '',
      args: [],
    );
  }

  /// `نسيت كلمة المرور ؟`
  String get forgetPassword {
    return Intl.message(
      'نسيت كلمة المرور ؟',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور`
  String get forgotPasswordBody {
    return Intl.message(
      'أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور',
      name: 'forgotPasswordBody',
      desc: '',
      args: [],
    );
  }

  /// `أدخل بريدك الإلكتروني المسجل وسنرسل لك رمز التحقق`
  String get enterEmailToReset {
    return Intl.message(
      'أدخل بريدك الإلكتروني المسجل وسنرسل لك رمز التحقق',
      name: 'enterEmailToReset',
      desc: '',
      args: [],
    );
  }

  /// `إرسال الرمز`
  String get sendCode {
    return Intl.message('إرسال الرمز', name: 'sendCode', desc: '', args: []);
  }

  /// `العودة لتسجيل الدخول`
  String get backToLogin {
    return Intl.message(
      'العودة لتسجيل الدخول',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني غير صالح`
  String get emailValidation {
    return Intl.message(
      'البريد الإلكتروني غير صالح',
      name: 'emailValidation',
      desc: '',
      args: [],
    );
  }

  /// `إعادة تعيين كلمة المرور`
  String get resetPassword {
    return Intl.message(
      'إعادة تعيين كلمة المرور',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `أدخل رمز التحقق وكلمة المرور الجديدة`
  String get resetPasswordBody {
    return Intl.message(
      'أدخل رمز التحقق وكلمة المرور الجديدة',
      name: 'resetPasswordBody',
      desc: '',
      args: [],
    );
  }

  /// `أدخل رمز التحقق`
  String get enterOtpCode {
    return Intl.message(
      'أدخل رمز التحقق',
      name: 'enterOtpCode',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور الجديدة`
  String get newPassword {
    return Intl.message(
      'كلمة المرور الجديدة',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور يجب أن تكون 6 أحرف على الأقل`
  String get passwordLengthValidation {
    return Intl.message(
      'كلمة المرور يجب أن تكون 6 أحرف على الأقل',
      name: 'passwordLengthValidation',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Profile`
  String get insuranceProfile {
    return Intl.message(
      'Insurance Profile',
      name: 'insuranceProfile',
      desc: '',
      args: [],
    );
  }

  /// `Create Insurance Profile`
  String get createInsuranceProfile {
    return Intl.message(
      'Create Insurance Profile',
      name: 'createInsuranceProfile',
      desc: '',
      args: [],
    );
  }

  /// `Edit Insurance Profile`
  String get editInsuranceProfile {
    return Intl.message(
      'Edit Insurance Profile',
      name: 'editInsuranceProfile',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Company`
  String get insuranceCompany {
    return Intl.message(
      'Insurance Company',
      name: 'insuranceCompany',
      desc: '',
      args: [],
    );
  }

  /// `Select Insurance Company`
  String get selectInsuranceCompany {
    return Intl.message(
      'Select Insurance Company',
      name: 'selectInsuranceCompany',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get otherCompany {
    return Intl.message('Other', name: 'otherCompany', desc: '', args: []);
  }

  /// `Company Name`
  String get customCompanyName {
    return Intl.message(
      'Company Name',
      name: 'customCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Enter company name`
  String get enterCustomCompanyName {
    return Intl.message(
      'Enter company name',
      name: 'enterCustomCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Number`
  String get insuranceNumber {
    return Intl.message(
      'Insurance Number',
      name: 'insuranceNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter insurance number`
  String get enterInsuranceNumber {
    return Intl.message(
      'Enter insurance number',
      name: 'enterInsuranceNumber',
      desc: '',
      args: [],
    );
  }

  /// `ID Card`
  String get idCard {
    return Intl.message('ID Card', name: 'idCard', desc: '', args: []);
  }

  /// `ID Card Front`
  String get idCardFront {
    return Intl.message(
      'ID Card Front',
      name: 'idCardFront',
      desc: '',
      args: [],
    );
  }

  /// `ID Card Back`
  String get idCardBack {
    return Intl.message('ID Card Back', name: 'idCardBack', desc: '', args: []);
  }

  /// `Insurance Card`
  String get insuranceCard {
    return Intl.message(
      'Insurance Card',
      name: 'insuranceCard',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Card Front`
  String get insuranceCardFront {
    return Intl.message(
      'Insurance Card Front',
      name: 'insuranceCardFront',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Card Back`
  String get insuranceCardBack {
    return Intl.message(
      'Insurance Card Back',
      name: 'insuranceCardBack',
      desc: '',
      args: [],
    );
  }

  /// `Tap to capture`
  String get tapToCapture {
    return Intl.message(
      'Tap to capture',
      name: 'tapToCapture',
      desc: '',
      args: [],
    );
  }

  /// `Selected`
  String get imageSelected {
    return Intl.message('Selected', name: 'imageSelected', desc: '', args: []);
  }

  /// `No Insurance Profile`
  String get noInsuranceProfile {
    return Intl.message(
      'No Insurance Profile',
      name: 'noInsuranceProfile',
      desc: '',
      args: [],
    );
  }

  /// `Create your insurance profile now to benefit from health insurance services and get exclusive discounts`
  String get noInsuranceProfileHint {
    return Intl.message(
      'Create your insurance profile now to benefit from health insurance services and get exclusive discounts',
      name: 'noInsuranceProfileHint',
      desc: '',
      args: [],
    );
  }

  /// `Insurance profile created successfully`
  String get insuranceProfileCreated {
    return Intl.message(
      'Insurance profile created successfully',
      name: 'insuranceProfileCreated',
      desc: '',
      args: [],
    );
  }

  /// `Insurance profile updated successfully`
  String get insuranceProfileUpdated {
    return Intl.message(
      'Insurance profile updated successfully',
      name: 'insuranceProfileUpdated',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد ملف تأميني`
  String get no_insurance_profile_title {
    return Intl.message(
      'لا يوجد ملف تأميني',
      name: 'no_insurance_profile_title',
      desc: '',
      args: [],
    );
  }

  /// `أنشئ ملفك التأميني الآن للاستفادة من خدمات التأمين الصحي والحصول على خصومات حصرية`
  String get no_insurance_profile_description {
    return Intl.message(
      'أنشئ ملفك التأميني الآن للاستفادة من خدمات التأمين الصحي والحصول على خصومات حصرية',
      name: 'no_insurance_profile_description',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء ملف تأميني`
  String get create_insurance_profile_button {
    return Intl.message(
      'إنشاء ملف تأميني',
      name: 'create_insurance_profile_button',
      desc: '',
      args: [],
    );
  }

  /// `خصومات على الأدوية`
  String get insurance_feature_discount {
    return Intl.message(
      'خصومات على الأدوية',
      name: 'insurance_feature_discount',
      desc: '',
      args: [],
    );
  }

  /// `متابعة طلباتك بسهولة`
  String get insurance_feature_tracking {
    return Intl.message(
      'متابعة طلباتك بسهولة',
      name: 'insurance_feature_tracking',
      desc: '',
      args: [],
    );
  }

  /// `تغطية تأمينية شاملة`
  String get insurance_feature_coverage {
    return Intl.message(
      'تغطية تأمينية شاملة',
      name: 'insurance_feature_coverage',
      desc: '',
      args: [],
    );
  }

  /// `طريقة التوصيل`
  String get deleiveryType {
    return Intl.message(
      'طريقة التوصيل',
      name: 'deleiveryType',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد فروع متاحة`
  String get emptyBranches {
    return Intl.message(
      'لا توجد فروع متاحة',
      name: 'emptyBranches',
      desc: '',
      args: [],
    );
  }

  /// `الأقرب`
  String get nearest {
    return Intl.message('الأقرب', name: 'nearest', desc: '', args: []);
  }

  /// `اختر فرع الصيدلية`
  String get choosePharmacyBranch {
    return Intl.message(
      'اختر فرع الصيدلية',
      name: 'choosePharmacyBranch',
      desc: '',
      args: [],
    );
  }

  /// `كم`
  String get km {
    return Intl.message('كم', name: 'km', desc: '', args: []);
  }

  /// `اختر فرع آخر`
  String get chooseAnotherBranch {
    return Intl.message(
      'اختر فرع آخر',
      name: 'chooseAnotherBranch',
      desc: '',
      args: [],
    );
  }

  /// `تتبع علي الخريطة`
  String get trackOnMap {
    return Intl.message(
      'تتبع علي الخريطة',
      name: 'trackOnMap',
      desc: '',
      args: [],
    );
  }

  /// `البطاقة الشخصية`
  String get nationalId {
    return Intl.message(
      'البطاقة الشخصية',
      name: 'nationalId',
      desc: '',
      args: [],
    );
  }

  /// `وجه البطاقة`
  String get id_card_front_title {
    return Intl.message(
      'وجه البطاقة',
      name: 'id_card_front_title',
      desc: '',
      args: [],
    );
  }

  /// `اضغط لتصوير وجه البطاقة الشخصية`
  String get id_card_front_hint {
    return Intl.message(
      'اضغط لتصوير وجه البطاقة الشخصية',
      name: 'id_card_front_hint',
      desc: '',
      args: [],
    );
  }

  /// `ظهر البطاقة`
  String get id_card_back_title {
    return Intl.message(
      'ظهر البطاقة',
      name: 'id_card_back_title',
      desc: '',
      args: [],
    );
  }

  /// `اضغط لتصوير ظهر البطاقة الشخصية`
  String get id_card_back_hint {
    return Intl.message(
      'اضغط لتصوير ظهر البطاقة الشخصية',
      name: 'id_card_back_hint',
      desc: '',
      args: [],
    );
  }

  /// `الملف التأمينى مطلوب`
  String get insuranceProfileValidation {
    return Intl.message(
      'الملف التأمينى مطلوب',
      name: 'insuranceProfileValidation',
      desc: '',
      args: [],
    );
  }

  /// `بطاقة التأمين`
  String get insurance_card_section_title {
    return Intl.message(
      'بطاقة التأمين',
      name: 'insurance_card_section_title',
      desc: '',
      args: [],
    );
  }

  /// `وجه بطاقة التأمين`
  String get insurance_card_front_title {
    return Intl.message(
      'وجه بطاقة التأمين',
      name: 'insurance_card_front_title',
      desc: '',
      args: [],
    );
  }

  /// `اضغط لتصوير وجه بطاقة التأمين`
  String get insurance_card_front_hint {
    return Intl.message(
      'اضغط لتصوير وجه بطاقة التأمين',
      name: 'insurance_card_front_hint',
      desc: '',
      args: [],
    );
  }

  /// `ظهر بطاقة التأمين`
  String get insurance_card_back_title {
    return Intl.message(
      'ظهر بطاقة التأمين',
      name: 'insurance_card_back_title',
      desc: '',
      args: [],
    );
  }

  /// `اضغط لتصوير ظهر بطاقة التأمين`
  String get insurance_card_back_hint {
    return Intl.message(
      'اضغط لتصوير ظهر بطاقة التأمين',
      name: 'insurance_card_back_hint',
      desc: '',
      args: [],
    );
  }

  /// `تم الاختيار ✓`
  String get doneSelected {
    return Intl.message(
      'تم الاختيار ✓',
      name: 'doneSelected',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء ملف تأمينى`
  String get createFile {
    return Intl.message(
      'إنشاء ملف تأمينى',
      name: 'createFile',
      desc: '',
      args: [],
    );
  }

  /// `تعديل الملف التأميني`
  String get editFile {
    return Intl.message(
      'تعديل الملف التأميني',
      name: 'editFile',
      desc: '',
      args: [],
    );
  }

  /// `طلبات التأمين`
  String get insuranceOrders {
    return Intl.message(
      'طلبات التأمين',
      name: 'insuranceOrders',
      desc: '',
      args: [],
    );
  }

  /// `طلبات الروشتات`
  String get prescriptionOrders {
    return Intl.message(
      'طلبات الروشتات',
      name: 'prescriptionOrders',
      desc: '',
      args: [],
    );
  }

  /// `Prescription`
  String get prescription {
    return Intl.message(
      'Prescription',
      name: 'prescription',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy Address`
  String get pharmacyAddress {
    return Intl.message(
      'Pharmacy Address',
      name: 'pharmacyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, this feature requires login. Please log in to continue enjoying all the app's features.`
  String get guestLogin {
    return Intl.message(
      'Sorry, this feature requires login. Please log in to continue enjoying all the app\'s features.',
      name: 'guestLogin',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest {
    return Intl.message('Guest', name: 'guest', desc: '', args: []);
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
