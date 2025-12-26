import 'package:auto_route/auto_route.dart';
import 'package:bond/features/location/location_helper.dart';
import 'package:bond/features/location/presentation/widgets/my_address/add_new_address_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/router/app_router.gr.dart';
import '../../../../../core/bloc/helper/base_state.dart';
import '../../../../../core/utils/api_config.dart';
import '../../../data/models/response/my_address.dart';
import '../../cubit/my_address/my_address_cubit.dart';
import 'address_list_design.dart';
import 'my_address_header.dart';

class MyAddressBody extends StatelessWidget {
  final bool isSelectionMode;
  final Function(MyAddress)? onAddressSelected;

  const MyAddressBody({
    super.key,
    this.isSelectionMode = false,
    this.onAddressSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyAddressCubit, BaseState<List<MyAddress>>>(
      builder: (context, state) {
        return Column(
          children: [
            MyAddressHeader(),
            Expanded(
              child: AddressListDesign(
                isLoading: state.isLoading && state.identifier == "getMyAddress",
                addressList: state.data ?? [],
                addressCallback: (address) {
                  if (isSelectionMode) {
                    onAddressSelected?.call(address);
                  }
                },
                showActions: !isSelectionMode,
                selectedAddressId: ApiConfig.address?.id,
                onRefresh: () => context.read<MyAddressCubit>().getMyAddress(),
                onEdit: (address) => context.router
                      .push(AddAddressRoute(address: address))
                      .then((_) {
                    if (context.mounted) {
                      context.read<MyAddressCubit>().getMyAddress();
                    }
                  }),
                onDelete: (address) async {
                  final response = await LocationHelper().showDelete(
                    context: context,
                    address: address,
                  );
                  if (response) {
                    context.read<MyAddressCubit>().deleteAddress(
                        id: address.id!);
                  }
                },
                onSetDefault: (address) {
                  context.read<MyAddressCubit>().makeAddressDefault(
                      myAddress: address);
                },
              ),
            ),
            AddNewAddressButton(),
          ],
        );
      },
    );
  }
}
