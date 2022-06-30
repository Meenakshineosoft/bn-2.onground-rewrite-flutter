import 'package:equatable/equatable.dart';

abstract class DashboardCubitState extends Equatable {}

class InitialState extends DashboardCubitState{
  @override
  List<Object?> get props => [];
  
}

class TabIndexChange extends DashboardCubitState{
  TabIndexChange({required this.index});
  final int index;
  @override
  List<Object?> get props => [index];
  
}