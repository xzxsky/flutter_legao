// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_textData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextData _$TextDataFromJson(Map<String, dynamic> json) => TextData(
      text: json['text'] as String?,
      textFamily: json['textFamily'] as String?,
      textFont: json['textFont'] as String?,
      textFontSize: json['textFontSize'] as String?,
      textColor: json['textColor'] as String?,
      textSelectedColor: json['textSelectedColor'] as String?,
      trackInfo: json['trackInfo'] as String?,
      jumpData: json['jumpData'] == null
          ? null
          : JumpData.fromJson(json['jumpData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextDataToJson(TextData instance) => <String, dynamic>{
      'text': instance.text,
      'textFamily': instance.textFamily,
      'textFont': instance.textFont,
      'textFontSize': instance.textFontSize,
      'textColor': instance.textColor,
      'textSelectedColor': instance.textSelectedColor,
      'trackInfo': instance.trackInfo,
      'jumpData': instance.jumpData,
    };
