import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/notifications/data/models/notification_model.dart';
import 'package:bond/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:bond/features/notifications/presentation/widgets/empty_notifications_widget.dart';
import 'package:bond/features/notifications/presentation/widgets/notification_item_widget.dart';
import 'package:bond/features/notifications/presentation/widgets/notifications_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsBody extends StatefulWidget {
  const NotificationsBody({super.key});

  @override
  State<NotificationsBody> createState() => _NotificationsBodyState();
}

class _NotificationsBodyState extends State<NotificationsBody>
    with TickerProviderStateMixin {
  late AnimationController _listAnimationController;
  final List<AnimationController> _itemControllers = [];

  @override
  void initState() {
    super.initState();
    _listAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    _listAnimationController.dispose();
    for (var controller in _itemControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _initItemControllers(int count) {
    // Clear old controllers
    for (var controller in _itemControllers) {
      controller.dispose();
    }
    _itemControllers.clear();

    // Create new controllers for each item
    for (int i = 0; i < count; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
      );
      _itemControllers.add(controller);

      // Stagger the animations
      Future.delayed(Duration(milliseconds: 80 * i), () {
        if (mounted && i < _itemControllers.length) {
          _itemControllers[i].forward();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, BaseState<List<NotificationModel>>>(
      builder: (context, state) {
        if (state.isLoading || state.isInitial) {
          return const NotificationsShimmer();
        }

        final notifications = state.data ?? [];

        if (notifications.isEmpty) {
          return const EmptyNotificationsWidget();
        }

        // Initialize controllers when data arrives
        if (_itemControllers.length != notifications.length) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _initItemControllers(notifications.length);
          });
        }

        return RefreshIndicator(
          onRefresh: () async {
            await context.read<NotificationsCubit>().getAllNotifications();
          },
          color: context.colorScheme.primary,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final notification = notifications[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: _itemControllers.length > index
                            ? AnimatedBuilder(
                                animation: _itemControllers[index],
                                builder: (context, child) {
                                  final animation = CurvedAnimation(
                                    parent: _itemControllers[index],
                                    curve: Curves.easeOutBack,
                                  );
                                  return Transform.translate(
                                    offset: Offset(
                                      0,
                                      30 * (1 - animation.value),
                                    ),
                                    child: Opacity(
                                      opacity: animation.value,
                                      child: child,
                                    ),
                                  );
                                },
                                child: NotificationItemWidget(
                                  notification: notification,
                                  index: index,
                                  onDelete: () => _handleDelete(context, notification),
                                ),
                              )
                            : NotificationItemWidget(
                                notification: notification,
                                index: index,
                                onDelete: () {
                                  _handleDelete(context, notification);
                                },
                              ),
                      );
                    },
                    childCount: notifications.length,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 80.h),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleDelete(BuildContext context, NotificationModel notification) {
    final cubit = context.read<NotificationsCubit>();
    if (notification.id != null) {
      cubit.deleteNotification(id:notification.id.toString());
    }
  }
}











