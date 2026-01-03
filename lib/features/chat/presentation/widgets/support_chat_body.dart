import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/chat/data/models/response/ticket_model.dart';
import 'package:bond/features/chat/presentation/cubit/tickets/ticket_cubit.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/router/app_router.gr.dart';
import 'empty_tickets_widget.dart';
import 'ticket_item_widget.dart';

class SupportChatBody extends StatefulWidget {
  const SupportChatBody({super.key});

  @override
  State<SupportChatBody> createState() => _SupportChatBodyState();
}

class _SupportChatBodyState extends State<SupportChatBody>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketCubit, BaseState<List<TicketModel>>>(
      builder: (context, state) {
        if (state.isLoading && state.identifier == "getTickets" ||
            state.isInitial) {
          return LoadingWidget();
        }
        final tickets = state.data ?? [];
        if (tickets.isEmpty) {
          return const EmptyTicketsWidget();
        }

        return RefreshIndicator(
          onRefresh: () async =>
          await context.read<TicketCubit>()
              .getAllTickets(),
          color: context.colorScheme.primary,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SliverToBoxAdapter(child: Container(
                margin: EdgeInsets.all(8.w),
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.colorScheme.primary.withValues(alpha: 0.1),
                      context.colorScheme.primary.withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: context.colorScheme.primary.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary.withValues(
                            alpha: 0.15),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.support_agent_rounded,
                        color: context.colorScheme.primary,
                        size: 28.sp,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.title(
                            text: context.localizations.customerSupport,
                            textSize: 14,
                          ),
                          SizedBox(height: 4.h),
                          AppText.hint(
                            text:
                            '${context.localizations.youHave} ${state.data
                                ?.length} ${context.localizations
                                .supportTickets}',
                            textSize: 11,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final ticket = tickets[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: TicketItemWidget(
                        ticket: ticket,
                        index: index,
                        onTap: () {
                          context.router.push(
                            ChatMessagesRoute(
                             ticketModel: ticket
                            ),
                          );
                        },
                      ),
                    );
                  }, childCount: tickets.length),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
