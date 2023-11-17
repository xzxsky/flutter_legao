import 'package:json_annotation/json_annotation.dart';
part 'card_jumpData.g.dart';
@JsonSerializable()
class JumpData {
  late String? jumpUrl;
  String? type;
  Map<String, dynamic>? params;
  JumpData({required this.jumpUrl, this.type, this.params});
  factory JumpData.fromJson(Map<String, dynamic> json) => _$JumpDataFromJson(json);
  Map<String, dynamic> toJson() => _$JumpDataToJson(this);

}