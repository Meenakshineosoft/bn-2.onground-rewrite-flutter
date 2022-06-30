// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      employeeId: json['employee_id'] as int?,
      employeeRoleId: json['employee_role_id'] as int?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      organizationName: json['organization_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      profilePicUrl: json['profile_pic_url'] as String?,
      skipAllowed: json['skip_allowed'] as bool?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'employee_id': instance.employeeId,
      'employee_role_id': instance.employeeRoleId,
      'id': instance.id,
      'name': instance.name,
      'organization_name': instance.organizationName,
      'phone_number': instance.phoneNumber,
      'profile_pic_url': instance.profilePicUrl,
      'skip_allowed': instance.skipAllowed,
    };
