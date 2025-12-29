import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../data/models/response/my_address.dart';
import 'address_item_design.dart';
import 'empty_address_design.dart';

class AddressListDesign extends StatefulWidget {
  final List<MyAddress> addressList;
  final Function(MyAddress) addressCallback;
  final bool showActions;
  final Future<void> Function()? onRefresh;
  final Function(MyAddress)? onEdit;
  final Function(MyAddress)? onDelete;
  final Function(MyAddress)? onSetDefault;
  final bool isLoading;

  const AddressListDesign({
    super.key,
    required this.addressList,
    required this.addressCallback,
    required this.showActions,
    this.onRefresh,
    this.onEdit,
    this.onDelete,
    this.onSetDefault,
    required this.isLoading,
  });

  @override
  State<AddressListDesign> createState() => _AddressListDesignState();
}

class _AddressListDesignState extends State<AddressListDesign> {
  num? _selectedAddress;

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return LoadingWidget();
    }
    if (widget.addressList.isEmpty) {
      return EmptyAddressDesign();
    }
    return RefreshIndicator(
      onRefresh: widget.onRefresh ?? () async {},
      color: context.colorScheme.primary,
      backgroundColor: context.colorScheme.surface,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        itemCount: widget.addressList.length,
        itemBuilder: (context, index) {
          final address = widget.addressList[index];
          return AddressItemDesign(
            index: index,
            address: address,
            isSelected: _selectedAddress == address.id,
            onDelete: widget.onDelete,
            onSetDefault: widget.onSetDefault,
            onEdit: widget.onEdit,
          );
        },
      ),
    );
  }
}
