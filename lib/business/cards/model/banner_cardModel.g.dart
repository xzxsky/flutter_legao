// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_cardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerCardModel _$BannerCardModelFromJson(Map<String, dynamic> json) =>
    BannerCardModel(
      cardType: json['cardType'] as String,
      trackInfo: json['trackInfo'] as String?,
      jumpData: json['jumpData'] == null
          ? null
          : JumpData.fromJson(json['jumpData'] as Map<String, dynamic>),
      index: json['index'] as int?,
      linkCardViewName: json['linkCardViewName'] as String?,
      subCardList: (json['subCardList'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
      image: json['image'] == null
          ? null
          : ImageData.fromJson(json['image'] as Map<String, dynamic>),
    )..subCardModelList = (json['subCardModelList'] as List<dynamic>?)
        ?.map((e) => e as Object)
        .toList();

Map<String, dynamic> _$BannerCardModelToJson(BannerCardModel instance) =>
    <String, dynamic>{
      'cardType': instance.cardType,
      'trackInfo': instance.trackInfo,
      'jumpData': instance.jumpData,
      'index': instance.index,
      'linkCardViewName': instance.linkCardViewName,
      'subCardList': instance.subCardList,
      'subCardModelList': instance.subCardModelList,
      'image': instance.image,
    };
