import 'package:auto_route/annotations.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/chat/data/models/response/message_model.dart';
import 'package:bond/features/chat/data/models/response/ticket_model.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../cubit/message/message_cubit.dart';
import '../widgets/chat_message_body.dart';
import '../widgets/message_bubble_widget.dart';
import '../widgets/chat_input_widget.dart';
import '../widgets/chat_messages_shimmer.dart';

@RoutePage()
class ChatMessagesScreen extends StatelessWidget {
  final TicketModel ticketModel;

  const ChatMessagesScreen({super.key, required this.ticketModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MessageCubit>()..getTicketDetails(ticketId: ticketModel.id!.toInt()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: ticketModel.title ?? "",
          showBackButton: true,
          actions: [Padding(
            padding: EdgeInsetsDirectional.only(end: 16.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.confirmation_number_outlined,
                    size: 14.sp,
                    color: context.colorScheme.primary,
                  ),
                  SizedBox(width: 4.w),
                  AppText(
                    text: '#${ticketModel.ticketNumber}',
                    textSize: 11,
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          )],
        ),
        body: Column(
          children: [
            Expanded(child: ChatMessagesBody(ticketId: ticketModel.id!.toInt())),
            ChatInputWidget(ticketId: ticketModel.id!.toInt()),
            SizedBox(height: SizeConfig.bodyHeight*.02,),
          ],
        ),
      ),
    );
  }

}

