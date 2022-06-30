import 'package:equatable/equatable.dart';
import 'package:on_ground/model/dashborad/organisation_data.dart';

abstract class HomeCubitState extends Equatable{}

class InitialState extends HomeCubitState{
  @override
  List<Object?> get props => [];
  
}

class OrgListData extends HomeCubitState {
  OrgListData({this.activeUser,this.organisationList});
  final List<OrganisationData>? organisationList;
  final List<OrganisationData>? activeUser;
  @override
  List<Object?> get props => [activeUser,organisationList];
}