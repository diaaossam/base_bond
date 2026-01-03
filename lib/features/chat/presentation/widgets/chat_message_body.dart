import 'package:bond/features/chat/presentation/widgets/empty_message_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/helper/base_state.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../data/models/response/message_model.dart';
import '../cubit/message/message_cubit.dart';
import 'chat_messages_shimmer.dart';
import 'message_bubble_widget.dart';

class ChatMessagesBody extends StatefulWidget {
  final int ticketId;

  const ChatMessagesBody({super.key, required this.ticketId});

  @override
  State<ChatMessagesBody> createState() => ChatMessagesBodyState();
}

class ChatMessagesBodyState extends State<ChatMessagesBody>
    with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageCubit, BaseState<List<MessageModel>>>(
      builder: (context, state) {
        if ((state.isLoading && state.identifier == "getTicketDetails") || state.isInitial) {
          return const ChatMessagesShimmer();
        }

        final messages = state.data ?? [];

        if (messages.isEmpty) {
          return EmptyMessageDesign();
        }
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.colorScheme.surface,
                context.colorScheme.primary.withValues(alpha: 0.02),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView.builder(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isMe = !(message.isAdmin ?? false);
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child:MessageBubbleWidget(message: message, isMe: isMe),
              );
            },
          ),
        );
      },
    );
  }

}

