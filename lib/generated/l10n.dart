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
