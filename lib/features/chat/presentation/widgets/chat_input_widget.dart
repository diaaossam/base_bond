import 'package:bond/config/theme/theme_helper.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/chat/presentation/cubit/message/message_cubit.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatInputWidget extends StatefulWidget {
  final int ticketId;

  const ChatInputWidget({super.key, required this.ticketId});

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool hasText = false;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CustomTextFormField(
              controller: _controller,
              focusNode: _focusNode,
              maxLines: 4,
              minLines: 1,
              onChanged: (value) => setState(() => hasText = value!.isNotEmpty),
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: context.localizations.typeMessage,
                focusedBorder: ThemeHelper().buildMainTffBorder(context: context),
                enabledBorder: ThemeHelper().buildMainTffBorder(context: context),
                border: ThemeHelper().buildMainTffBorder(context: context),
                contentPadding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 10.w),
              ),
              onSubmitted: (_) => _sendMessage(context),
            ),
          ),
          SizedBox(width: 12.w),
          BlocBuilder<MessageCubit, BaseState>(
            builder: (context, state) {
              final isLoading = state.isLoading && state.identifier == "sendMessage";
              final isEnabled = !isLoading;
              return GestureDetector(
                onTap: isEnabled ? () => _sendMessage(context) : null,
                child: Container(
                  width: 35.w,
                  height: 35.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:hasText ? context.colorScheme.primary : context.colorScheme.shadow
                  ),
                  child: Center(
                    child: isLoading
                        ? SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white.withValues(alpha: 0.9),
                              ),
                            ),
                          )
                        : Icon(
                          Icons.send_rounded,
                          color: isEnabled
                              ? Colors.white
                              : context.colorScheme.outline.withValues(
                                  alpha: 0.5,
                                ),
                          size: 22.sp,
                        ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(BuildContext context) {
    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      context.read<MessageCubit>().sendMessage(
        ticketId: widget.ticketId,
        message: message,
      );
      _controller.clear();
    }
  }
}
