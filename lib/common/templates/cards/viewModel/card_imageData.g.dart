// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_imageData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
      url: json['url'] as String?,
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toDouble(),
      trackInfo: json['trackInfo'] as String?,
      jumpData: json['jumpData'] == null
          ? null
          : JumpData.fromJson(json['jumpData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'radius': instance.radius,
      'trackInfo': instance.trackInfo,
      'jumpData': instance.jumpData,
    };
