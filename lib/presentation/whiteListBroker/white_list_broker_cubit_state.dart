import 'package:equatable/equatable.dart';
import 'package:google_place/google_place.dart';
import 'package:on_ground/model/employee/employee_model.dart';
import 'package:on_ground/model/polygon/polygon_model.dart';

abstract class WhiteListBrokerCubiteState extends Equatable {}

class InitialState extends WhiteListBrokerCubiteState {
  @override
  List<Object?> get props => [];
}

class GetListDataState extends WhiteListBrokerCubiteState {
  GetListDataState({this.employeeList,this.polygonList,this.predictions});
  final List<EmployeeModel>? employeeList;
  final List<PolygoneModel>? polygonList;
  final List<AutocompletePrediction>? predictions;
  @override
  List<Object?> get props => [employeeList,polygonList];
}