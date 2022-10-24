import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object?> get props => [];
}

class MainInitialState extends MainState {}

class MainNoConnectionState extends MainState {
  @override
  List<Object?> get props => [];
}

class MainSuccessConnectionState extends MainState {
  // final Widget home;

  // const MainSuccessConnectionState(this.home);

  @override
  List<Object?> get props => [];
}
