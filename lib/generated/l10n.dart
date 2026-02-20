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

  /// `We’re happy to have you with us!`
  String get registerTitle {
    return Intl.message(
      'We’re happy to have you with us!',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Just a few quick steps to start your journey with us`
  String get registerBody {
    return Intl.message(
      'Just a few quick steps to start your journey with us',
      name: 'registerBody',
      desc: '',
      args: [],
    );
  }

  /// `Welcome !`
  String get loginTitle {
    return Intl.message('Welcome !', name: 'loginTitle', desc: '', args: []);
  }

  /// `Enter your phone number to log in`
  String get loginBody {
    return Intl.message(
      'Enter your phone number to log in',
      name: 'loginBody',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Create New Account`
  String get createNewAccount {
    return Intl.message(
      'Create New Account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Continue as Guest`
  String get loginAsGuest {
    return Intl.message(
      'Continue as Guest',
      name: 'loginAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don’t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Didn’t receive the code?`
  String get dontReceiveCode {
    return Intl.message(
      'Didn’t receive the code?',
      name: 'dontReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resendCode {
    return Intl.message('Resend', name: 'resendCode', desc: '', args: []);
  }

  /// `Enter Verification Code (OTP)`
  String get otpTitle {
    return Intl.message(
      'Enter Verification Code (OTP)',
      name: 'otpTitle',
      desc: '',
      args: [],
    );
  }

  /// `We’ve sent a 6-digit code to your email address`
  String get otpBody {
    return Intl.message(
      'We’ve sent a 6-digit code to your email address',
      name: 'otpBody',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Governorate`
  String get governorate {
    return Intl.message('Governorate', name: 'governorate', desc: '', args: []);
  }

  /// `Region`
  String get region {
    return Intl.message('Region', name: 'region', desc: '', args: []);
  }

  /// `Loading`
  String get loading {
    return Intl.message('Loading', name: 'loading', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message('My Orders', name: 'myOrders', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Login with Google`
  String get loginViaGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginViaGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get loginViaApple {
    return Intl.message(
      'Login with Apple',
      name: 'loginViaApple',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `Best Sellers`
  String get bestSellers {
    return Intl.message(
      'Best Sellers',
      name: 'bestSellers',
      desc: '',
      args: [],
    );
  }

  /// `New Arrivals`
  String get newArrivals {
    return Intl.message(
      'New Arrivals',
      name: 'newArrivals',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get recommendedProducts {
    return Intl.message(
      'Recommended',
      name: 'recommendedProducts',
      desc: '',
      args: [],
    );
  }

  /// `All Categories`
  String get allCategories {
    return Intl.message(
      'All Categories',
      name: 'allCategories',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get egp {
    return Intl.message('EGP', name: 'egp', desc: '', args: []);
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

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `You have`
  String get youHave {
    return Intl.message('You have', name: 'youHave', desc: '', args: []);
  }

  /// `Point`
  String get point {
    return Intl.message('Point', name: 'point', desc: '', args: []);
  }

  /// `Use this code to redeem your points`
  String get pointHint {
    return Intl.message(
      'Use this code to redeem your points',
      name: 'pointHint',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message('Copy', name: 'copy', desc: '', args: []);
  }

  /// `My Points`
  String get myPoints {
    return Intl.message('My Points', name: 'myPoints', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsAndCon {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndCon',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Choose your preferred app language`
  String get languageHint {
    return Intl.message(
      'Choose your preferred app language',
      name: 'languageHint',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Mode`
  String get mode {
    return Intl.message('Mode', name: 'mode', desc: '', args: []);
  }

  /// `Customer Support`
  String get customerSupport {
    return Intl.message(
      'Customer Support',
      name: 'customerSupport',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message('Log Out', name: 'logOut', desc: '', args: []);
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `No description available`
  String get noDescription {
    return Intl.message(
      'No description available',
      name: 'noDescription',
      desc: '',
      args: [],
    );
  }

  /// `Show More`
  String get showMore {
    return Intl.message('Show More', name: 'showMore', desc: '', args: []);
  }

  /// `Show Less`
  String get showLess {
    return Intl.message('Show Less', name: 'showLess', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
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

  /// `Under Review`
  String get underReview {
    return Intl.message(
      'Under Review',
      name: 'underReview',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed`
  String get confirmed {
    return Intl.message('Confirmed', name: 'confirmed', desc: '', args: []);
  }

  /// `In Progress`
  String get inProgress {
    return Intl.message('In Progress', name: 'inProgress', desc: '', args: []);
  }

  /// `Out for Delivery`
  String get outForDeleivery {
    return Intl.message(
      'Out for Delivery',
      name: 'outForDeleivery',
      desc: '',
      args: [],
    );
  }

  /// `Returned`
  String get returns {
    return Intl.message('Returned', name: 'returns', desc: '', args: []);
  }

  /// `Delivered`
  String get deleiverd {
    return Intl.message('Delivered', name: 'deleiverd', desc: '', args: []);
  }

  /// `Canceled`
  String get canceled {
    return Intl.message('Canceled', name: 'canceled', desc: '', args: []);
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Added to cart`
  String get addedToCart {
    return Intl.message(
      'Added to cart',
      name: 'addedToCart',
      desc: '',
      args: [],
    );
  }

  /// `Product added to cart successfully`
  String get productAddedToCartSuccess {
    return Intl.message(
      'Product added to cart successfully',
      name: 'productAddedToCartSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Go to Cart`
  String get goToCart {
    return Intl.message('Go to Cart', name: 'goToCart', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Location on Map`
  String get locationOnMap {
    return Intl.message(
      'Location on Map',
      name: 'locationOnMap',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get addNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Save Address`
  String get saveLocation {
    return Intl.message(
      'Save Address',
      name: 'saveLocation',
      desc: '',
      args: [],
    );
  }

  /// `Address saved successfully`
  String get locationPickedSuccessFully {
    return Intl.message(
      'Address saved successfully',
      name: 'locationPickedSuccessFully',
      desc: '',
      args: [],
    );
  }

  /// `No saved addresses`
  String get noLocation {
    return Intl.message(
      'No saved addresses',
      name: 'noLocation',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Available quantity only`
  String get availableQuantity {
    return Intl.message(
      'Available quantity only',
      name: 'availableQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message('Cash', name: 'cash', desc: '', args: []);
  }

  /// `Card`
  String get visa {
    return Intl.message('Card', name: 'visa', desc: '', args: []);
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

  /// `Favorites list is empty`
  String get noWithList {
    return Intl.message(
      'Favorites list is empty',
      name: 'noWithList',
      desc: '',
      args: [],
    );
  }

  /// `Cart is empty`
  String get noCart {
    return Intl.message('Cart is empty', name: 'noCart', desc: '', args: []);
  }

  /// `Your shopping cart is empty. Please add products first.`
  String get emptyCartHint {
    return Intl.message(
      'Your shopping cart is empty. Please add products first.',
      name: 'emptyCartHint',
      desc: '',
      args: [],
    );
  }

  /// `Your favorites list is empty. Please add products first.`
  String get emptyWishHint {
    return Intl.message(
      'Your favorites list is empty. Please add products first.',
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

  /// `Active Substances`
  String get activeSubstance {
    return Intl.message(
      'Active Substances',
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

  /// `Are you sure you want to log out?`
  String get logoutBody {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutBody',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loadingText {
    return Intl.message('Loading...', name: 'loadingText', desc: '', args: []);
  }

  /// `No orders found`
  String get noOrdersFound {
    return Intl.message(
      'No orders found',
      name: 'noOrdersFound',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message('Details', name: 'details', desc: '', args: []);
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

  /// `Cancel Order`
  String get cancelOrder {
    return Intl.message(
      'Cancel Order',
      name: 'cancelOrder',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel the order?`
  String get cancelOrderConfirm {
    return Intl.message(
      'Are you sure you want to cancel the order?',
      name: 'cancelOrderConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `No Notifications`
  String get noNotificationTitle {
    return Intl.message(
      'No Notifications',
      name: 'noNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your notifications will appear here when you receive them`
  String get noNotificationBody {
    return Intl.message(
      'Your notifications will appear here when you receive them',
      name: 'noNotificationBody',
      desc: '',
      args: [],
    );
  }

  /// `Your order is under review`
  String get underReview_desc {
    return Intl.message(
      'Your order is under review',
      name: 'underReview_desc',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been confirmed and is being prepared`
  String get confirmed_desc {
    return Intl.message(
      'Your order has been confirmed and is being prepared',
      name: 'confirmed_desc',
      desc: '',
      args: [],
    );
  }

  /// `Your order is being prepared`
  String get inProgress_desc {
    return Intl.message(
      'Your order is being prepared',
      name: 'inProgress_desc',
      desc: '',
      args: [],
    );
  }

  /// `Your order is on the way`
  String get outForDelivery_desc {
    return Intl.message(
      'Your order is on the way',
      name: 'outForDelivery_desc',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been delivered successfully`
  String get delivered_desc {
    return Intl.message(
      'Your order has been delivered successfully',
      name: 'delivered_desc',
      desc: '',
      args: [],
    );
  }

  /// `The order has been returned`
  String get returns_desc {
    return Intl.message(
      'The order has been returned',
      name: 'returns_desc',
      desc: '',
      args: [],
    );
  }

  /// `The order has been canceled`
  String get canceled_desc {
    return Intl.message(
      'The order has been canceled',
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

  /// `No Products`
  String get noProductsTitle {
    return Intl.message(
      'No Products',
      name: 'noProductsTitle',
      desc: '',
      args: [],
    );
  }

  /// `No matching products found`
  String get noProductsBody {
    return Intl.message(
      'No matching products found',
      name: 'noProductsBody',
      desc: '',
      args: [],
    );
  }

  /// `Our Services`
  String get ourServices {
    return Intl.message(
      'Our Services',
      name: 'ourServices',
      desc: '',
      args: [],
    );
  }

  /// `Request with your insurance`
  String get orderWithYourInsurance {
    return Intl.message(
      'Request with your insurance',
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

  /// `Support Team`
  String get supportTeam {
    return Intl.message(
      'Support Team',
      name: 'supportTeam',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get passwordConfirmation {
    return Intl.message(
      'Confirm Password',
      name: 'passwordConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirmation do not match`
  String get passwordValidation {
    return Intl.message(
      'Password and confirmation do not match',
      name: 'passwordValidation',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgetPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to reset your password`
  String get forgotPasswordBody {
    return Intl.message(
      'Enter your email to reset your password',
      name: 'forgotPasswordBody',
      desc: '',
      args: [],
    );
  }

  /// `Enter your registered email and we’ll send you a verification code`
  String get enterEmailToReset {
    return Intl.message(
      'Enter your registered email and we’ll send you a verification code',
      name: 'enterEmailToReset',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get sendCode {
    return Intl.message('Send Code', name: 'sendCode', desc: '', args: []);
  }

  /// `Back to Login`
  String get backToLogin {
    return Intl.message(
      'Back to Login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get emailValidation {
    return Intl.message(
      'Invalid email address',
      name: 'emailValidation',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter the verification code and your new password`
  String get resetPasswordBody {
    return Intl.message(
      'Enter the verification code and your new password',
      name: 'resetPasswordBody',
      desc: '',
      args: [],
    );
  }

  /// `Enter verification code`
  String get enterOtpCode {
    return Intl.message(
      'Enter verification code',
      name: 'enterOtpCode',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long`
  String get passwordLengthValidation {
    return Intl.message(
      'Password must be at least 6 characters long',
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

  /// `No Insurance Profile`
  String get no_insurance_profile_title {
    return Intl.message(
      'No Insurance Profile',
      name: 'no_insurance_profile_title',
      desc: '',
      args: [],
    );
  }

  /// `Create your insurance profile now to benefit from health insurance services and get exclusive discounts`
  String get no_insurance_profile_description {
    return Intl.message(
      'Create your insurance profile now to benefit from health insurance services and get exclusive discounts',
      name: 'no_insurance_profile_description',
      desc: '',
      args: [],
    );
  }

  /// `Create Insurance Profile`
  String get create_insurance_profile_button {
    return Intl.message(
      'Create Insurance Profile',
      name: 'create_insurance_profile_button',
      desc: '',
      args: [],
    );
  }

  /// `Discounts on Medications`
  String get insurance_feature_discount {
    return Intl.message(
      'Discounts on Medications',
      name: 'insurance_feature_discount',
      desc: '',
      args: [],
    );
  }

  /// `Easily Track Your Orders`
  String get insurance_feature_tracking {
    return Intl.message(
      'Easily Track Your Orders',
      name: 'insurance_feature_tracking',
      desc: '',
      args: [],
    );
  }

  /// `Comprehensive Insurance Coverage`
  String get insurance_feature_coverage {
    return Intl.message(
      'Comprehensive Insurance Coverage',
      name: 'insurance_feature_coverage',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Method`
  String get deleiveryType {
    return Intl.message(
      'Delivery Method',
      name: 'deleiveryType',
      desc: '',
      args: [],
    );
  }

  /// `No Available Branches`
  String get emptyBranches {
    return Intl.message(
      'No Available Branches',
      name: 'emptyBranches',
      desc: '',
      args: [],
    );
  }

  /// `Nearest`
  String get nearest {
    return Intl.message('Nearest', name: 'nearest', desc: '', args: []);
  }

  /// `Choose Pharmacy Branch`
  String get choosePharmacyBranch {
    return Intl.message(
      'Choose Pharmacy Branch',
      name: 'choosePharmacyBranch',
      desc: '',
      args: [],
    );
  }

  /// `km`
  String get km {
    return Intl.message('km', name: 'km', desc: '', args: []);
  }

  /// `Choose Another Branch`
  String get chooseAnotherBranch {
    return Intl.message(
      'Choose Another Branch',
      name: 'chooseAnotherBranch',
      desc: '',
      args: [],
    );
  }

  /// `Track on Map`
  String get trackOnMap {
    return Intl.message('Track on Map', name: 'trackOnMap', desc: '', args: []);
  }

  /// `National ID`
  String get nationalId {
    return Intl.message('National ID', name: 'nationalId', desc: '', args: []);
  }

  /// `ID Card Front`
  String get id_card_front_title {
    return Intl.message(
      'ID Card Front',
      name: 'id_card_front_title',
      desc: '',
      args: [],
    );
  }

  /// `Tap to capture the front of your ID card`
  String get id_card_front_hint {
    return Intl.message(
      'Tap to capture the front of your ID card',
      name: 'id_card_front_hint',
      desc: '',
      args: [],
    );
  }

  /// `ID Card Back`
  String get id_card_back_title {
    return Intl.message(
      'ID Card Back',
      name: 'id_card_back_title',
      desc: '',
      args: [],
    );
  }

  /// `Tap to capture the back of your ID card`
  String get id_card_back_hint {
    return Intl.message(
      'Tap to capture the back of your ID card',
      name: 'id_card_back_hint',
      desc: '',
      args: [],
    );
  }

  /// `Insurance profile is required`
  String get insuranceProfileValidation {
    return Intl.message(
      'Insurance profile is required',
      name: 'insuranceProfileValidation',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Card`
  String get insurance_card_section_title {
    return Intl.message(
      'Insurance Card',
      name: 'insurance_card_section_title',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Card Front`
  String get insurance_card_front_title {
    return Intl.message(
      'Insurance Card Front',
      name: 'insurance_card_front_title',
      desc: '',
      args: [],
    );
  }

  /// `Tap to capture the front of the insurance card`
  String get insurance_card_front_hint {
    return Intl.message(
      'Tap to capture the front of the insurance card',
      name: 'insurance_card_front_hint',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Card Back`
  String get insurance_card_back_title {
    return Intl.message(
      'Insurance Card Back',
      name: 'insurance_card_back_title',
      desc: '',
      args: [],
    );
  }

  /// `Tap to capture the back of the insurance card`
  String get insurance_card_back_hint {
    return Intl.message(
      'Tap to capture the back of the insurance card',
      name: 'insurance_card_back_hint',
      desc: '',
      args: [],
    );
  }

  /// `Selected ✓`
  String get doneSelected {
    return Intl.message('Selected ✓', name: 'doneSelected', desc: '', args: []);
  }

  /// `Create Insurance File`
  String get createFile {
    return Intl.message(
      'Create Insurance File',
      name: 'createFile',
      desc: '',
      args: [],
    );
  }

  /// `Edit Insurance File`
  String get editFile {
    return Intl.message(
      'Edit Insurance File',
      name: 'editFile',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Orders`
  String get insuranceOrders {
    return Intl.message(
      'Insurance Orders',
      name: 'insuranceOrders',
      desc: '',
      args: [],
    );
  }

  /// `Prescription Orders`
  String get prescriptionOrders {
    return Intl.message(
      'Prescription Orders',
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

  /// `Notify me when available`
  String get notifyWhenAvailable {
    return Intl.message(
      'Notify me when available',
      name: 'notifyWhenAvailable',
      desc: '',
      args: [],
    );
  }

  /// `We will notify you when the product is available`
  String get notifyWhenAvailableSuccess {
    return Intl.message(
      'We will notify you when the product is available',
      name: 'notifyWhenAvailableSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Sub Category`
  String get subCategory {
    return Intl.message(
      'Sub Category',
      name: 'subCategory',
      desc: '',
      args: [],
    );
  }

  /// `Division`
  String get division {
    return Intl.message('Division', name: 'division', desc: '', args: []);
  }

  /// `Please select an address`
  String get pleaseSelectAddress {
    return Intl.message(
      'Please select an address',
      name: 'pleaseSelectAddress',
      desc: '',
      args: [],
    );
  }

  /// `Our Branches`
  String get ourBranches {
    return Intl.message(
      'Our Branches',
      name: 'ourBranches',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
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
