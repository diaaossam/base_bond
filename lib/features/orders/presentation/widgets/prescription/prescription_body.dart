import 'package:animate_do/animate_do.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/services/caching/common_caching.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/features/location/data/models/response/my_address.dart';
import 'package:bond/features/orders/presentation/cubit/prescription/prescription_cubit.dart';
import 'package:bond/features/orders/presentation/cubit/prescription/prescription_state_data.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cart/delivery/cart_location_design.dart';
import '../cart/payment/payment_type.dart';
import 'delivery_method_design.dart';
import 'prescription_discount_design.dart';
import 'prescription_image_picker.dart';

class PrescriptionBody extends StatefulWidget {
  const PrescriptionBody({super.key});

  @override
  State<PrescriptionBody> createState() => _PrescriptionBodyState();
}

class _PrescriptionBodyState extends State<PrescriptionBody>
    with TickerProviderStateMixin {
  MyAddress? defaultAddress;

  @override
  void initState() {
    super.initState();
    _initializeAddress();
  }

  void _initializeAddress() {

    defaultAddress = CommonCaching.defaultAddress;
    if (defaultAddress != null && mounted) {
      context.read<PrescriptionCubit>().setSelectedAddress(defaultAddress!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrescriptionCubit, BaseState<PrescriptionStateData>>(
      listener: (context, state) {
        if (state.isFailure) {
          final error = state.error == 'prescriptionRequired'
              ? context.localizations.prescriptionRequired
              : state.error.toString();
          AppConstant.showCustomSnakeBar(context, error, false);
        }
        else if (state.isSuccess && state.identifier == 'submit') {
          AppConstant.showCustomSnakeBar(
            context,
            context.localizations.prescriptionSubmitted,
            true,
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        final bloc = context.read<PrescriptionCubit>();
        final data = state.data ?? const PrescriptionStateData();
        return CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverToBoxAdapter(
              child: FadeInDown(
                duration: const Duration(milliseconds: 600),
                child: _buildHeaderSection(context),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              sliver: SliverToBoxAdapter(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 700),
                  delay: const Duration(milliseconds: 100),
                  child: PrescriptionImagePicker(
                    selectedImage: data.prescriptionImage,
                    onImageSelected: (file) => bloc.setPrescriptionImage(file),
                  ),
                ),
              ),
            ),

            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w,),
                sliver:  CartLocationDesign(
                  defaultAddress: defaultAddress,
                  onAddressChanged: (address) {
                    setState(() => defaultAddress = address);
                    bloc.setSelectedAddress(address);
                  },
                ),
              ),

            // Payment Type Section
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w,),
              sliver: PaymentTypeDesign(
                payment: (type) => bloc.setPaymentType(type),
              ),
            ),

            // Note Section
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              sliver: SliverToBoxAdapter(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 700),
                  delay: const Duration(milliseconds: 500),
                  child: _buildNoteSection(context, bloc),
                ),
              ),
            ),

            // Submit Button
            SliverPadding(
              padding: EdgeInsets.all(16.w),
              sliver: SliverToBoxAdapter(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 700),
                  delay: const Duration(milliseconds: 600),
                  child: Pulse(
                    infinite: false,
                    duration: const Duration(milliseconds: 1000),
                    delay: const Duration(milliseconds: 1200),
                    child: CustomButton(
                      text: context.localizations.submitPrescription,
                      isLoading:
                          state.isLoading && state.identifier == 'submit',
                      press: () => bloc.submitPrescription(),
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          ],
        );
      },
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Column(
      children: [
        SizedBox(height: 16.h),
        // Title
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 200),
          child: AppText.title(
            text: context.localizations.prescriptionTitle,
            align: TextAlign.center,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4.h),

        // Body
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 300),
          child: AppText.body(
            text: context.localizations.prescriptionBody,
            align: TextAlign.center,
            color: colorScheme.shadow,
          ),
        ),
      ],
    );
  }

  Widget _buildNoteSection(BuildContext context, PrescriptionCubit bloc) {
    final colorScheme = context.colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.tertiary.withValues(alpha: 0.15),
                      colorScheme.tertiary.withValues(alpha: 0.08),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.note_alt_rounded,
                  color: colorScheme.tertiary,
                  size: 22,
                ),
              ),
              12.horizontalSpace,
              AppText(
                text: context.localizations.prescriptionNote,
                fontWeight: FontWeight.w700,
                textSize: 12,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomTextFormField(
            controller: bloc.noteController,
            hintText: context.localizations.prescriptionNoteHint,
            filled: true,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
