import 'package:auto_route/annotations.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../cubit/notifications_cubit.dart';
import '../widgets/notifications_body.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NotificationsCubit>()..getAllNotifications(),
      child: Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: CustomAppBar(
          title: context.localizations.notifications,
          showBackButton: true,
        ),
        body: const NotificationsBody(),
      ),
    );
  }
}

