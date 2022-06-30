import 'package:equatable/equatable.dart';
import 'package:on_ground/model/search/search_model.dart';

abstract class SearchCubitState extends Equatable {}

class InitialState extends SearchCubitState {
  @override
  List<Object?> get props => [];  
}

class SearchList extends SearchCubitState {
  SearchList({this.searchModel});
  final int? searchModel;
  @override
  List<Object?> get props => [searchModel];
}