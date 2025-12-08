import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../base_state.dart';

/// Network connection status data model
class NetworkStatus {
  final bool isConnected;
  final List<ConnectivityResult> connectivityResults;

  const NetworkStatus({
    required this.isConnected,
    required this.connectivityResults,
  });

  NetworkStatus copyWith({
    bool? isConnected,
    List<ConnectivityResult>? connectivityResults,
  }) {
    return NetworkStatus(
      isConnected: isConnected ?? this.isConnected,
      connectivityResults: connectivityResults ?? this.connectivityResults,
    );
  }
}

@Injectable()
class NetworkCubit extends Cubit<BaseState<NetworkStatus>> {
  final Connectivity _connectivity = Connectivity();

  NetworkCubit() : super(BaseState.initial()) {
    _checkInitialConnection();
    monitorInternetConnection();
  }

  Future<void> _checkInitialConnection() async {
    emit(state.loading());
    final results = await _connectivity.checkConnectivity();
    final isConnected = !results.contains(ConnectivityResult.none);
    emit(
      state.success(
        data: NetworkStatus(
          isConnected: isConnected,
          connectivityResults: results,
        ),
      ),
    );
  }

  void monitorInternetConnection() {
    _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        try {
          final isConnected = !results.contains(ConnectivityResult.none);

          emit(
            state.success(
              data: NetworkStatus(
                isConnected: isConnected,
                connectivityResults: results,
              ),
              identifier: "NetworkStatus",
            ),
          );
        } catch (error) {
          emit(state.failure(error, identifier: "NetworkStatus"));
        }
      },
      onError: (error, stackTrace) {
        emit(state.failure(error, identifier: "NetworkStatus"));
      },
    );
  }
}
