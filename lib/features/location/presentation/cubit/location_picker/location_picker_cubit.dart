import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/location/presentation/cubit/location_picker/location_picker_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/services/location/location_permission_service.dart';

@Injectable()
class LocationPickerCubit extends Cubit<BaseState<LocationPickerData>> {
  LocationPickerCubit() : super(BaseState());

  Future<void> initLocationService() async {
    try {
      emit(state.copyWith(status: BaseStatus.loading));
      final result = await LocationPermissionService()
          .requestPermissionAndLocation();
      if (result != null) {
        emit(
          state.copyWith(
            status: BaseStatus.success,
            data: LocationPickerData(
              currentLocation: result,
              markers: {
                Marker(
                  markerId: const MarkerId("Me"),
                  position: result,
                  icon: BitmapDescriptor.defaultMarker,
                ),
              },
            ),
          ),
        );
      } else {
        emit(state.copyWith(status: BaseStatus.failure));
      }
    } catch (error) {
      emit(state.copyWith(status: BaseStatus.loading));
    }
  }

  Future<void> changeLocation({required LatLng value}) async {
    emit(
      state.copyWith(
        data: LocationPickerData(
          currentLocation: value,
          markers: {
            Marker(
              markerId: const MarkerId("Me"),
              position: value,
              icon: BitmapDescriptor.defaultMarker,
            ),
          },
        ),
      ),
    );
  }
}
