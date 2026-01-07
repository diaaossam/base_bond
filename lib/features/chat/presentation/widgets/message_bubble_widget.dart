import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/chat/data/models/response/message_model.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MessageBubbleWidget extends StatelessWidget {
  final MessageModel message;
  final bool isMe;

  const MessageBubbleWidget({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
          decoration: BoxDecoration(
            gradient: isMe
                ? LinearGradient(
                    colors: [
                      context.colorScheme.primary,
                      context.colorScheme.primary.withValues(alpha: 0.9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: isMe ? null : context.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
              bottomLeft: isMe ? Radius.circular(12.r) : Radius.circular(4.r),
              bottomRight: isMe ? Radius.circular(4.r) : Radius.circular(20.r),
            ),
            boxShadow: [
              BoxShadow(
                color: isMe
                    ? context.colorScheme.primary.withValues(alpha: 0.3)
                    : context.colorScheme.shadow.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (!isMe) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.support_agent_rounded,
                        size: 14.sp,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    AppText(
                      text: context.localizations.supportTeam,
                      textSize: 11,
                      fontWeight: FontWeight.w600,
                      color: context.colorScheme.primary,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
              ],
              AppText(
                text: message.message ?? '',
                textSize: 11,
                color: isMe ? Colors.white : context.colorScheme.onSurface,
                maxLines: 100,
                textHeight: 1.4,
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.done_all,
                    size: 10.sp,
                    color: isMe
                        ? Colors.white.withValues(alpha: 0.7)
                        : context.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  SizedBox(width: 4.w),
                  AppText(
                    text: _formatTime(message.createdAt),
                    textSize: 9,
                    color: isMe
                        ? Colors.white.withValues(alpha: 0.7)
                        : context.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(String? dateString) {
    if (dateString == null) return '';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('hh:mm a').format(date);
    } catch (e) {
      return dateString;
    }
  }
}







