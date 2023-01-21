import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<ConnectivityResult> {
  final Connectivity _connectivity;
  late final StreamSubscription _connectivityStream;

  InternetCubit({required Connectivity connectivity})
      : _connectivity = connectivity,
      super(ConnectivityResult.none) {
    _connectivityStream = _connectivity.onConnectivityChanged.listen((ConnectivityResult res) {
      emit(res);
    });
  }

  @override
  Future<void> close() {
    _connectivityStream.cancel();
    return super.close();
  }
}