import 'package:json_annotation/json_annotation.dart';

part 'add_note_req.g.dart';

@JsonSerializable()
class AddNotesReqBody {
  AddNotesReqBody({this.brokerId,this.data,this.type});
  @JsonKey(name: 'broker_id')
  final String? brokerId;
  final String? data;
  final String? type;

  Map<String,dynamic> toJson() => _$AddNotesReqBodyToJson(this);
}