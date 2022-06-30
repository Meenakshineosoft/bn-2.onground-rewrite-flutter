
import 'package:json_annotation/json_annotation.dart';
part 'history.g.dart';
@JsonSerializable()
class History {
  History({this.insertedAt,this.type});
  @JsonKey(name: 'inserted_at')
  final int? insertedAt;
  final String? type;

  factory History.fromJson(Map<String,dynamic> json) => _$HistoryFromJson(json);
}