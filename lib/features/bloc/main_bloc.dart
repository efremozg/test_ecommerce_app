import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/connectivity_service.dart';
import 'main_events.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final ConnectivityService _connectivityService;

  MainBloc({required ConnectivityService connectivityService})
      : _connectivityService = connectivityService,
        super(MainInitialState()) {
    _connectivityService.streamController.stream.listen(
      (event) {
        if (event == ConnectivityResult.none) {
          print('No internet connection');
          add(MainNoConnectionEvent());
        } else {
          print('Internet connection is fine!');
          add(MainSuccessConnectionEvent());
        }
      },
    );
    on<MainSuccessConnectionEvent>(_onMainSuccessConection);
    on<MainNoConnectionEvent>(_onMainNoConnection);
  }
  void _onMainSuccessConection(
      MainSuccessConnectionEvent event, Emitter<MainState> emit) {
    emit(MainSuccessConnectionState());
  }

  void _onMainNoConnection(
      MainNoConnectionEvent event, Emitter<MainState> emit) {
    emit(MainNoConnectionState());
  }
}
