import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/location/presentation/cubit/location_picker/location_picker_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LocationPickerCubit extends Cubit<BaseState<LocationPickerData>> {
  LocationPickerCubit() : super(BaseState());

  Future<void> initLocationService() async {
    try {
      emit(InitLocationServiceLoading());
      final result = await LocationPermissionService()
          .requestPermissionAndLocation();
      if (result != null) {
        currentLocation = result;
        markers.add(
          Marker(
            markerId: const MarkerId("Me"),
            position: result,
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
        emit(InitLocationServiceSuccess());
      } else {
        emit(InitLocationServiceFailure());
      }
    } catch (error) {
      print(error.toString());
      emit(InitLocationServiceFailure());
    }
  }

  Future<void> changeLocation({required LatLng value}) async {
    markers.clear();
    currentLocation = value;
    markers.add(
      Marker(
        markerId: const MarkerId("Me"),
        position: value,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    emit(ChangeUserLocationOnMapState());
  }
}
