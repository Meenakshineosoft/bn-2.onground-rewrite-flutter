import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {}

class InitialState extends SplashState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends SplashState {
  @override
  List<Object?> get props => [];
}
class LoadedState extends SplashState {
  LoadedState(this.routeState);
  final RouteState routeState;
  @override
  List<Object?> get props => [routeState];
}

enum RouteState {
  login,
  home
}