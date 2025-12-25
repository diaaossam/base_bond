import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/router/app_router.gr.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/image_picker/app_image.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../data/models/requests/location_entity.dart';
import '../../data/models/response/my_address.dart';

class AddNewAddressBody extends StatefulWidget {
  final MyAddress? address;

  const AddNewAddressBody({super.key, this.address});

  @override
  State<AddNewAddressBody> createState() => _AddNewAddressBodyState();
}

class _AddNewAddressBodyState extends State<AddNewAddressBody> {
  final _formKey = GlobalKey<FormBuilderState>();
  LocationEntity? locationEntity;

  @override
  void initState() {
    if (widget.address != null &&
        widget.address!.lat != null &&
        widget.address!.lng != null) {
      locationEntity = LocationEntity(
        lat: double.parse(widget.address!.lat.toString()),
        lon: double.parse(widget.address!.lng.toString()),
        address: widget.address!.address ?? "",
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: screenPadding(),
        child: Column(
          children: [
            Container(
              height: SizeConfig.bodyHeight * .02,
              color: context.colorScheme.surface,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            InkWell(
              onTap: () => context.router
                  .push<LocationEntity>(PickLocationRoute())
                  .then((p0) {
                    if (p0 != null) {
                      setState(() => locationEntity = p0);
                    }
                  }),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colorScheme.surface,
                      border: Border.all(color: context.colorScheme.outline),
                    ),
                    child: AppImage.asset(
                      Assets.icons.pinLocation02,
                      color: context.colorScheme.primary,
                      height: SizeConfig.bodyHeight * .03,
                    ),
                  ),
                  10.horizontalSpace,
                  AppText(
                    text: locationEntity != null
                        ? context.localizations.locationPickedSuccessFully
                        : context.localizations.locationOnMap,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
      ),
    );
  }
}
