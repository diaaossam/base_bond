import 'package:flutter/material.dart';

import 'app.dart';
import 'initialization.dart';

Future<void> main() async {
  await initializeApp();
  runApp(MyApp());
}
