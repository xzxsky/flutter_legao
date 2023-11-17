import 'package:json_annotation/json_annotation.dart';

import 'card_jumpData.dart';
part 'card_imageData.g.dart';
@JsonSerializable()
class ImageData {
  late String? url;
  double? width;
  double? height;
  double? radius;
  String? trackInfo;
  JumpData? jumpData;
  ImageData({required this.url, this.width, this.height, this.radius, this.trackInfo,this.jumpData});
  factory ImageData.fromJson(Map<String, dynamic> json) => _$ImageDataFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDataToJson(this);
}