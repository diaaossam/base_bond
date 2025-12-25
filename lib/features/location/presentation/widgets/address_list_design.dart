import 'package:flutter/material.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/api_config.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/image_picker/app_image.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../data/models/response/my_address.dart';
import 'address_item_design.dart';

class AddressListDesign extends StatefulWidget {
  final List<MyAddress> addressList;
  final Function(MyAddress) addressCallback;
  final bool showActions;
  final Future<void> Function()? onRefresh;

  const AddressListDesign({
    super.key,
    required this.addressList,
    required this.addressCallback,
    required this.showActions,
    this.onRefresh,
  });

  @override
  State<AddressListDesign> createState() => _AddressListDesignState();
}

class _AddressListDesignState extends State<AddressListDesign> {
  num? _selectedAddress;

  @override
  void initState() {
    _selectedAddress = ApiConfig.address?.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.addressList.isEmpty) {
      return Expanded(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .08),
            AppImage.asset(
              Assets.images.noLocation.path,
              height: SizeConfig.bodyHeight * .3,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            Center(
              child: AppText(
                textSize: 16,
                text: context.localizations.noLocation,
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
      );
    } else {
      return Expanded(
        child: RefreshIndicator(
          onRefresh: widget.onRefresh ?? () async {},
          child: ListView.separated(
            itemBuilder: (context, index) => InkWell(
              onTap: () async {
                if (widget.showActions) return;
                setState(() => _selectedAddress = widget.addressList[index].id);
                widget.addressCallback(widget.addressList[index]);
              },
              child: AddressItemDesign(
                callback: () {
                  setState(
                    () => _selectedAddress = widget.addressList[index].id,
                  );
                  widget.addressCallback(widget.addressList[index]);
                },
                showActions: widget.showActions,
                isSelected: _selectedAddress == widget.addressList[index].id,
                address: widget.addressList[index],
              ),
            ),
            separatorBuilder: (context, index) => Container(
              color: context.colorScheme.outline,
              height: 1,
              width: SizeConfig.screenWidth,
            ),
            itemCount: widget.addressList.length,
          ),
        ),
      );
    }
  }
}
