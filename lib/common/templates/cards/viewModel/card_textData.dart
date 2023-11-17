
import 'package:json_annotation/json_annotation.dart';

import 'card_jumpData.dart';
part 'card_textData.g.dart';
@JsonSerializable()
class TextData {
  String? text;
  String? textFamily;
  String? textFont;
  String? textFontSize;
  String? textColor;
  String? textSelectedColor;
  String? trackInfo;
  JumpData? jumpData;
  TextData({required this.text, this.textFamily, this.textFont,this.textFontSize,this.textColor,this.textSelectedColor,this.trackInfo,this.jumpData});
  factory TextData.fromJson(Map<String, dynamic> json) => _$TextDataFromJson(json);
  Map<String, dynamic> toJson() => _$TextDataToJson(this);
}