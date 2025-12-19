import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/dependencies/injectable_dependencies.dart';
import 'config/environment/environment_helper.dart';
import 'core/bloc/helper/bloc_observer.dart';
import 'core/services/firebase/firebase_helper.dart';
import 'core/services/notification_service/notification_service.dart';
import 'core/utils/api_config.dart';


Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await dotenv.load(fileName: Environment.fileName);
  configureDependencies();
  await ApiConfig().init();
  await FirebaseHelper().initFirebaseServices();
  await NotificationService().initNotification();
}
