import 'package:auto_route/annotations.dart';
import 'package:bond/features/settings/presentation/cubit/pages_cubit.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/dependencies/injectable_dependencies.dart';
import '../widgets/privacy_page_body.dart';

@RoutePage()
class PrivacyScreen extends StatelessWidget {
  final String title;
  final num id;

  const PrivacyScreen({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PagesCubit>()..getCustomPage(id: id),
      child: Scaffold(
        appBar: CustomAppBar(title: title),
        body: PrivacyPageBody(),
      ),
    );
  }
}
