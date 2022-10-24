import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_ecommerce_internship/features/details/presentation/bloc/details_event.dart';

import '../../../../components/connectivity_service.dart';
import '../../data/datasource/details_datasource.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final DetailsDataRemoteService _detailsDataRemoteService;

  DetailsBloc({
    required DetailsDataRemoteService detailsDataRemoteService,
  })  : _detailsDataRemoteService = detailsDataRemoteService,
        super(DetailsLoadingState()) {
    on<LoadDetailsEvent>(_onDetailsLoaded);
  }

  void _onDetailsLoaded(
      LoadDetailsEvent event, Emitter<DetailsState> emit) async {
    final detailsInfo = await _detailsDataRemoteService.getDetails();

    emit(DetailsLoadedState(loadedDetails: detailsInfo));
  }

  // void _onDetailsNoConnection(
  //     DetailsNoConnectionEvent event, Emitter<DetailsState> emit) {
  //   emit(DetailsNoConnectionState());
  // }
}
