import 'package:json_annotation/json_annotation.dart';
import 'package:on_ground/model/dashborad/brokers_data.dart';

part 'organisation_data.g.dart';

@JsonSerializable()
class OrganisationData {
  OrganisationData({this.brokersData,this.orgName});
  factory OrganisationData.fromJson(Map<String,dynamic> json) => _$OrganisationDataFromJson(json);
  @JsonKey(name: 'brokers_data')
  final List<BrokersData>? brokersData;
  @JsonKey(name: 'org_name')
  final String? orgName;
}