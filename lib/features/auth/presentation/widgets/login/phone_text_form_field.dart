import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';

class MobileNumberField extends StatelessWidget {
  final String? name;
  final String? title;
  final String? data;
  final bool isRequired;

  const MobileNumberField({
    super.key,
    this.name,
    this.title,
    this.data,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: CustomTextFormField(
        initialValue: data,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
        ],
        textDirection: TextDirection.ltr,
        validator: isRequired
            ? FormBuilderValidators.required(
                errorText: context.localizations.validation,
              )
            : null,
        name: name ?? 'phone',
        hintText: context.localizations.phoneNumber,
        prefixIconConstraints: BoxConstraints(
          maxHeight: 40.h,
          minHeight: 10.h,
          minWidth: 40.w,
        ),
        keyboardType: TextInputType.phone,
        valueTransformer: (value) => '+20$value',
        maxLength: 10,
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.horizontalSpace,
            AppImage.asset(Assets.icons.egypt,size: 20.h,),
            10.horizontalSpace,
            AppText(text: "+20",fontWeight: FontWeight.w500,),
            10.horizontalSpace,
          ],
        ),
        suffixIcon: AppImage.asset(Assets.icons.phone,size: 20,),
      ),
    );
  }
}
