
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/extensions/validitor_extention.dart';
import 'package:bond/features/chat/presentation/cubit/tickets/ticket_cubit.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateTicketSheet extends StatefulWidget {
  const CreateTicketSheet({super.key});

  @override
  State<CreateTicketSheet> createState() => _CreateTicketSheetState();
}

class _CreateTicketSheetState extends State<CreateTicketSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _slideAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 300 * _slideAnimation.value),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20.w),
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                context.colorScheme.primary.withValues(alpha: 0.1),
                                context.colorScheme.primary.withValues(alpha: 0.05),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: context.colorScheme.primary.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(
                                  color: context.colorScheme.primary.withValues(
                                    alpha: 0.15,
                                  ),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Icon(
                                  Icons.add_comment_rounded,
                                  color: context.colorScheme.primary,
                                  size: 24.sp,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText.title(
                                      text: context.localizations.createNewTicket,
                                      textSize: 14,
                                    ),
                                    SizedBox(height: 4.h),
                                    AppText.hint(
                                      text: context.localizations.createTicketHint,
                                      textSize: 11,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24.h),
                              AppText(
                                text: context.localizations.ticketTitle,
                                fontWeight: FontWeight.w600,
                                textSize: 11,
                              ),
                              SizedBox(height: 8.h),
                              CustomTextFormField(
                                name: "title",
                                hintText: context.localizations.ticketTitleHint,
                                validator: FormBuilderValidators.required(
                                  errorText: context.localizations.validation,
                                ),
                                suffixIcon: Icon(
                                  Icons.title_rounded,
                                  color: context.colorScheme.primary,
                                  size: 20.sp,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              AppText(
                                text: context.localizations.ticketMessage,
                                fontWeight: FontWeight.w600,
                                textSize: 11,
                              ),
                              SizedBox(height: 8.h),
                              CustomTextFormField(
                                name: "message",
                                hintText: context.localizations.ticketMessageHint,
                                maxLines: 4,
                                validator: FormBuilderValidators.required(
                                  errorText: context.localizations.validation,
                                ),

                                suffixIcon: Icon(
                                  Icons.message_rounded,
                                  color: context.colorScheme.primary,
                                  size: 20.sp,
                                ),
                              ),
                              SizedBox(height: 32.h),
                              BlocConsumer<TicketCubit, BaseState>(
                                listener: (context, state) {
                                  if (state.isSuccess && state.identifier == "createTicket") {
                                    Navigator.of(context).pop();
                                  }
                                },
                                builder: (context, state) {
                                  final isLoading = state.isLoading && state.identifier == "createTicket";
                                  return CustomButton(
                                    text: context.localizations.createTicket,
                                    isLoading: isLoading,
                                    press: () {
                                      if (_formKey.currentState!.saveAndValidate()) {
                                        context.read<TicketCubit>().createTicket(
                                          title: _formKey.fieldValue("title"),
                                          message:_formKey.fieldValue("message"),
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                              SizedBox(height: 24.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
