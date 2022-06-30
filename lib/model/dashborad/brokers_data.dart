
import 'package:json_annotation/json_annotation.dart';
import 'package:on_ground/model/dashborad/history.dart';

part 'brokers_data.g.dart';
@JsonSerializable()
class BrokersData {
  BrokersData({
    this.assignedOnEpoch,
    this.brokerId,
    this.brokerTypeId,
    this.firmAddress,
    this.gstNumber,
    this.history,
    this.isMarkedLost,
    this.lastActiveAt,
    this.lastActiveAtInDays,
    this.lastActivity,
    this.lastPost,
    this.lastPostDays,
    this.lostReason,
    this.name,
    this.orgName,
    this.orgUuid,
    this.phoneNumber,
    this.polygonId,
    this.profilePicUrl,
    this.reason,
    this.reraId,
    this.snoozed,
    this.snoozedTill,
    this.snoozedTillEpoch,
    this.uninstalled,
    this.userId
  });

  factory BrokersData.fromJson(Map<String,dynamic> json) => _$BrokersDataFromJson(json); 

  @JsonKey(name: 'assigned_on_epoch')
  final int? assignedOnEpoch;
  @JsonKey(name: 'broker_id')
  final int? brokerId;
  @JsonKey(name: 'broker_type_id')
  final String? brokerTypeId;
  @JsonKey(name: 'firm_address')
  final String? firmAddress;
  @JsonKey(name: 'gst_number')
  final String? gstNumber;
  final List<History>? history;
  @JsonKey(name: 'is_marked_lost')
  final bool? isMarkedLost;
  @JsonKey(name: 'last_active_at')
  final int? lastActiveAt;
  @JsonKey(name: 'last_active_at_in_days')
  final int? lastActiveAtInDays;
  @JsonKey(name: 'last_activity')
  final int? lastActivity;
  @JsonKey(name: 'last_post')
  final bool? lastPost;
  @JsonKey(name: 'last_post_days')
  final int? lastPostDays;
  @JsonKey(name: 'lost_reason')
  final String? lostReason;
  final String? name;
  @JsonKey(name: 'org_name')
  final String? orgName;
  @JsonKey(name: 'org_uuid')
  final String? orgUuid;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'polygon_id')
  final int? polygonId;
  @JsonKey(name: 'profile_pic_url')
  final String? profilePicUrl;
  final String? reason;
  @JsonKey(name: 'rera_id')
  final String? reraId;
  final bool? snoozed;
  @JsonKey(name: 'snoozed_till')
  final String? snoozedTill;
  @JsonKey(name: 'snoozed_till_epoch')
  final String? snoozedTillEpoch;
  final bool? uninstalled;
  @JsonKey(name: 'user_id')
  final int? userId;
}