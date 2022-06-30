import 'package:json_annotation/json_annotation.dart';

part 'suggestion.g.dart';
@JsonSerializable()
class Suggestion {
  Suggestion({this.id,this.name,this.phoneNumber});
  factory Suggestion.fromJson(Map<String,dynamic> json) => _$SuggestionFromJson(json);
  final int? id;
  final String? name;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
}