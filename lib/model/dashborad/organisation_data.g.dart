// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganisationData _$OrganisationDataFromJson(Map<String, dynamic> json) =>
    OrganisationData(
      brokersData: (json['brokers_data'] as List<dynamic>?)
          ?.map((e) => BrokersData.fromJson(e as Map<String, dynamic>))
          .toList(),
      orgName: json['org_name'] as String?,
    );

Map<String, dynamic> _$OrganisationDataToJson(OrganisationData instance) =>
    <String, dynamic>{
      'brokers_data': instance.brokersData,
      'org_name': instance.orgName,
    };
