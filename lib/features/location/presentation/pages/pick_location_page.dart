import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:aslol/core/extensions/app_localizations_extension.dart';
import 'package:aslol/core/services/location/location_geocodeing.dart';
import 'package:aslol/core/utils/app_size.dart';
import 'package:aslol/features/location/domain/entities/location_entity.dart';
import 'package:aslol/widgets/app_failure.dart';
import 'package:aslol/widgets/custom_button.dart';
import 'package:aslol/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_settings_plus/core/open_settings_plus.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../cubit/location_picker/location_picker_cubit.dart';
import '../cubit/location_picker/location_picker_state.dart';

@RoutePage()
class PickLocationScreen extends StatelessWidget { const PickLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LocationPickerCubit>()..initLocationService(),
      child: BlocBuilder<LocationPickerCubit, LocationPickerState>(
        builder: (context, state) {
          LocationPickerCubit cubit = BlocProvider.of<LocationPickerCubit>(context);
          if (state is InitLocationServiceSuccess || state is ChangeUserLocationOnMapState) {
            return Scaffold(
              body: SafeArea(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    GoogleMap(
                      mapType: MapType.terrain,
                      trafficEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: cubit.currentLocation!,
                        zoom: 15.0,
                      ),
                      markers: Set<Marker>.of(cubit.markers),
                      myLocationEnabled: true,
                      zoomControlsEnabled: true,
                      myLocationButtonEnabled: true,
                      onTap: (argument) =>
                          cubit.changeLocation(value: argument),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.bodyHeight * .1,
                          horizontal: SizeConfig.screenWidth * .06),
                      child: CustomButton(
                          text: context.localizations.saveLocation,
                          press: () async {
                            String address = await LocationGeoCoding()
                                .getMyAddress(latLng: cubit.currentLocation!);
                            LocationEntity locationEntity = LocationEntity(
                                address: address.isEmpty
                                    ? context.localizations
                                        .locationPickedSuccessFully
                                    : address,
                                lat: cubit.currentLocation!.latitude,
                                lon: cubit.currentLocation!.longitude);
                            context.router.maybePop(locationEntity);
                          }),
                    )
                  ],
                ),
              ),
            );
          } else if (state is InitLocationServiceFailure) {
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
          } else {
            return const Scaffold(
              body: LoadingWidget(),
            );
          }
        },
      ),
    );
  }
}
