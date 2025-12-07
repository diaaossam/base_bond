import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  Dio get dio => Dio();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  Connectivity get connectivity => Connectivity();
  FlutterSecureStorage get storage => FlutterSecureStorage(
    aOptions: AndroidOptions.biometric(
      enforceBiometrics: false,
      biometricPromptTitle: 'Authenticate',
    ),
  );


  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  FirebaseAnalytics get firebaseAnalytics => FirebaseAnalytics.instance;

  ImagePicker get imagePicker => ImagePicker();
}
