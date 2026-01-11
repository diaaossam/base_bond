import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/services/caching/common_caching.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/features/insurance_profile/presentation/widgets/empty_insurance_profile.dart';
import 'package:bond/features/location/data/models/response/my_address.dart';
import 'package:bond/features/orders/order_helper.dart';
import 'package:bond/features/orders/presentation/cubit/prescription/prescription_cubit.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/router/app_router.gr.dart';
import '../../../../../core/utils/api_config.dart';
import '../../../../insurance_profile/presentation/cubit/insurance_profile_cubit.dart';
import '../../../../insurance_profile/presentation/cubit/insurance_profile_state_data.dart';
import '../../../../insurance_profile/presentation/widgets/insurance_header_info.dart';
import '../../../../settings/presentation/widgets/settings_helper.dart';
import '../../../data/models/request/prescription_params.dart';
import '../cart/delivery/cart_location_design.dart';
import '../cart/payment/payment_type.dart';
import 'prescription_image_picker.dart';

class PrescriptionBody extends StatefulWidget {
  final bool isInsurance;

  const PrescriptionBody({super.key, required this.isInsurance});

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
      context.read<PrescriptionCubit>().setLocation(
        id: defaultAddress!.id ?? 0,
        isInsurance: widget.isInsurance,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrescriptionCubit, BaseState<PrescriptionParams>>(
      listener: (context, state) {
        if (state.isFailure) {
          final error = state.error == 'prescriptionRequired'
              ? context.localizations.prescriptionRequired
              : state.error.toString();
          AppConstant.showCustomSnakeBar(context, error, false);
        }
        else if (state.isSuccess && state.identifier == 'submit') {
         OrderHelper().showSuccessPrescriptionOrderDialog(context: context);
        }
      },
      builder: (context, state) {
        final bloc = context.read<PrescriptionCubit>();
        final data = state.data ?? PrescriptionParams();

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
            if (widget.isInsurance) ...[
              BlocBuilder<
                InsuranceProfileCubit,
                BaseState<InsuranceProfileStateData>
              >(
                builder: (context, state) {
                  if (state.isLoading) {
                    return SliverToBoxAdapter(child: LoadingWidget());
                  }
                  if (state.data!.hasProfile) {
                    return SliverPadding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 700),
                          delay: const Duration(milliseconds: 100),
                          child: InsuranceHeaderInfo(
                            onEdit: () {
                              context.router
                                  .push(
                                    CreateInsuranceProfileRoute(
                                      model: state.data!.profile,
                                    ),
                                  )
                                  .then((result) {
                                    if (result == true) {
                                      context
                                          .read<InsuranceProfileCubit>()
                                          .loadInsuranceProfile();
                                    }
                                  });
                            },
                            model: state.data!.profile!,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return SliverToBoxAdapter(
                      child: EmptyInsuranceProfile(
                        showDescription: false,
                        onCreatePressed: () {
                          context.router
                              .push(CreateInsuranceProfileRoute())
                              .then((result) {
                                if (result == true) {
                                  context
                                      .read<InsuranceProfileCubit>()
                                      .loadInsuranceProfile();
                                }
                              });
                        },
                      ),
                    );
                  }
                },
              ),
            ],
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              sliver: SliverToBoxAdapter(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 700),
                  delay: const Duration(milliseconds: 100),
                  child: PrescriptionImagePicker(
                    selectedImage: data.prescriptionImage,
                    onImageSelected: (file) {
                      bloc.updatePrescriptionParams(
                        params: data.copyWith(prescriptionImage: file),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: CartLocationDesign(
                defaultAddress: defaultAddress,
                onAddressChanged: (address) {
                  setState(() => defaultAddress = address);
                  bloc.updatePrescriptionParams(
                    params: data.copyWith(addressId: address.id),
                  );
                },
                onDeleiveryMethod: (method) {
                  bloc.updatePrescriptionParams(
                    params: data.copyWith(deliveryMethod: method),
                  );
                },
                onBranchChanged: (branch) {
                  bloc.updatePrescriptionParams(
                    params: data.copyWith(pharmacyBranchId: branch.id),
                  );
                },
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: PaymentTypeDesign(
                payment: (type) {
                  bloc.updatePrescriptionParams(
                    params: data.copyWith(paymentType: type),
                  );
                },
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              sliver: SliverToBoxAdapter(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 700),
                  delay: const Duration(milliseconds: 500),
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: context.colorScheme.primary.withValues(
                            alpha: 0.06,
                          ),
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
                                    context.colorScheme.tertiary.withValues(
                                      alpha: 0.15,
                                    ),
                                    context.colorScheme.tertiary.withValues(
                                      alpha: 0.08,
                                    ),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.note_alt_rounded,
                                color: context.colorScheme.tertiary,
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
                          hintText: context.localizations.prescriptionNoteHint,
                          filled: true,
                          maxLines: 3,
                          onChanged: (value) {
                            bloc.updatePrescriptionParams(
                              params: data.copyWith(note: value),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                      isLoading: state.isLoading && state.identifier == 'submit',
                      press: () {
                        if (ApiConfig.isGuest == true) {
                          SettingsHelper().showGuestDialog(context,);
                          return;
                        }
                        if (data.prescriptionImage == null) {
                          AppConstant.showToast(
                            msg: context.localizations.prescriptionRequired,
                          );
                          return;
                        }
                        bloc.submitPrescription(params: data);
                      },
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
}
