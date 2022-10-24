import 'package:equatable/equatable.dart';

import '../../data/models/details_model.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object?> get props => [];
}

// class DetailsNoConnectionState extends DetailsState {
//   @override
//   List<Object?> get props => [];
// }

class DetailsLoadingState extends DetailsState {
  @override
  List<Object?> get props => [];
}

class DetailsLoadedState extends DetailsState {
  final Details? loadedDetails;

  const DetailsLoadedState({required this.loadedDetails});

  @override
  List<Object?> get props => [loadedDetails];
}
