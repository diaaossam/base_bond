import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../orders/presentation/widgets/cart/empty_cart_design.dart';
import '../../../data/models/response/my_address.dart';
import 'address_item_design.dart';

class AddressListDesign extends StatefulWidget {
  final List<MyAddress> addressList;
  final Function(MyAddress) addressCallback;
  final bool showActions;
  final Future<void> Function()? onRefresh;
  final Function(MyAddress)? onEdit;
  final Function(MyAddress)? onDelete;
  final Function(MyAddress)? onSetDefault;
  final num? selectedAddressId;
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
    this.selectedAddressId,
    required this.isLoading,
  });

  @override
  State<AddressListDesign> createState() => _AddressListDesignState();
}

class _AddressListDesignState extends State<AddressListDesign> {
  num? _selectedAddress;

  @override
  void initState() {
    _selectedAddress = widget.selectedAddressId;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AddressListDesign oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedAddressId != oldWidget.selectedAddressId) {
      setState(() => _selectedAddress = widget.selectedAddressId);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.addressList.isEmpty) {
      return EmptyCartDesign();
    } else if (widget.isLoading) {
      return LoadingWidget();
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
