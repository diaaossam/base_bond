import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_settings_plus/core/open_settings_plus.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/services/location/location_geocodeing.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/app_failure.dart';
import '../../../../widgets/loading/loading_widget.dart';
import '../../../../widgets/main_widget/custom_button.dart';
import '../../data/models/requests/location_entity.dart';
import '../cubit/location_picker/location_picker_cubit.dart';
import '../cubit/location_picker/location_picker_data.dart';

@RoutePage()
class PickLocationScreen extends StatelessWidget {
  const PickLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LocationPickerCubit>()..initLocationService(),
      child: BlocBuilder<LocationPickerCubit, BaseState<LocationPickerData>>(
        builder: (context, state) {
          final cubit = context.read<LocationPickerCubit>();
          if (state.isFailure) {
            return Scaffold(
              body: AppFailureWidget(
                callback: () async {
                  if (Platform.isAndroid) {
                    await const OpenSettingsPlusAndroid().locationSource();
                  } else {
                    await const OpenSettingsPlusIOS().locationServices();
                  }
                },
              ),
            );
          } else if (state.isLoading) {
            return const Scaffold(body: LoadingWidget());
          } else {
            return Scaffold(
              body: SafeArea(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    GoogleMap(
                      mapType: MapType.terrain,
                      trafficEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: state.data!.currentLocation!,
                        zoom: 15.0,
                      ),
                      markers: Set<Marker>.of(state.data!.markers!),
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,
                      myLocationButtonEnabled: true,
                      onTap: (argument) =>
                          cubit.changeLocation(value: argument),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.bodyHeight * .04,
                        horizontal: SizeConfig.screenWidth * .06,
                      ),
                      child: CustomButton(
                        text: context.localizations.saveLocation,
                        press: () async {
                          String address = await LocationGeoCoding().getMyAddress(latLng: state.data!.currentLocation!);
                          LocationEntity locationEntity = LocationEntity(
                            address: address.isEmpty
                                ? context.localizations.locationPickedSuccessFully
                                : address,
                            lat:  state.data!.currentLocation!.latitude,
                            lon:  state.data!.currentLocation!.longitude,
                          );
                          context.router.maybePop(locationEntity);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
