import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  Profile({
    this.employeeId,
    this.employeeRoleId,
    this.id,
    this.name,
    this.organizationName,
    this.phoneNumber,
    this.profilePicUrl,
    this.skipAllowed
  }); 
  @JsonKey(name: "employee_id")
  final int? employeeId;
  @JsonKey(name: "employee_role_id")
  final int? employeeRoleId;
  final String? id;
  final String? name;
  @JsonKey(name: "organization_name")
  final String? organizationName;
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @JsonKey(name: "profile_pic_url")
  final String? profilePicUrl;
  @JsonKey(name: "skip_allowed")
  final bool? skipAllowed;

  factory Profile.fromJson(Map<String,dynamic> json) => _$ProfileFromJson(json);

  Map<String,dynamic> toJson() => _$ProfileToJson(this);
}