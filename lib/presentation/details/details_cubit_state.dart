import 'package:equatable/equatable.dart';
import 'package:on_ground/model/dashborad/brokers_data.dart';

abstract class DetailsCubitState extends Equatable {}
class IntialState extends DetailsCubitState {
  @override
  List<Object?> get props => [];
}

class DetailsData extends DetailsCubitState {
  DetailsData({this.data});
  final BrokersData? data;

  @override
  List<Object?> get props => [];
}