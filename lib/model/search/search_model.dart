import 'package:json_annotation/json_annotation.dart';
import 'package:on_ground/model/search/suggestion.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  SearchModel({this.suggestions});
  factory SearchModel.fromJson(Map<String,dynamic> json) => _$SearchModelFromJson(json);
   final List<Suggestion>? suggestions;

   
}