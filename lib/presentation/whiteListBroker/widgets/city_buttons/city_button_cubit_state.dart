import 'package:equatable/equatable.dart';

abstract class CityButtonCubitState extends Equatable {}

class IntialState extends CityButtonCubitState {

  @override
  List<Object?> get props => [];
}

class ChangeButtonState extends CityButtonCubitState {
  ChangeButtonState({this.id});
  final int? id;

  @override
  List<Object?> get props => [id];
  
}