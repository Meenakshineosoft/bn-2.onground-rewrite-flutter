import 'package:json_annotation/json_annotation.dart';
part 'polygon_model.g.dart';
@JsonSerializable()
class PolygoneModel {
  PolygoneModel({
    this.name,
    this.uuid
  });
  final String? name;
  final String? uuid;

  factory PolygoneModel.fromJson(Map<String,dynamic> json) => _$PolygoneModelFromJson(json);

}
