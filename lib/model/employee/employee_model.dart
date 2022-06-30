import 'package:json_annotation/json_annotation.dart';

part 'employee_model.g.dart';

@JsonSerializable()
class EmployeeModel  {
  EmployeeModel({this.name,this.uuid});
  final String? name;
  final String? uuid;

  factory EmployeeModel.fromJson(Map<String,dynamic> json) => _$EmployeeModelFromJson(json);
  
}