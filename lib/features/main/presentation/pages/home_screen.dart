import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widget/home/home_body.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeBody());
  }
}
