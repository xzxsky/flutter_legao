import 'package:flutter_legao/common/templates/cards/viewModel/card.dart';
import 'package:flutter_legao/common/templates/cards/viewModel/card_imageData.dart';
import 'package:flutter_legao/common/templates/cards/viewModel/card_jumpData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner_cardModel.g.dart';
@JsonSerializable()
class BannerCardModel extends CardModel {
  ImageData? image;

  factory BannerCardModel.createInstance(String cardViewName,Map<String, dynamic> map){
    BannerCardModel cardModel = BannerCardModel.fromJson(map);
    return cardModel;
  }
  BannerCardModel({required String cardType,
    String? trackInfo,
    JumpData? jumpData,
    int? index,
    String? linkCardViewName,
    List<Object>? subCardList,
    this.image}) : super(cardType: cardType,
      trackInfo: trackInfo,
      jumpData: jumpData,
      index: index,
      linkCardViewName: linkCardViewName,
      subCardList:subCardList);
  factory BannerCardModel.fromJson(Map<String, dynamic> json) => _$BannerCardModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannerCardModelToJson(this);
}