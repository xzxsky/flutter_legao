
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_legao/common/templates/cards/view/card_view.dart';
import 'package:flutter_legao/common/templates/cards/viewModel/card.dart';
import 'package:flutter_legao/common/templates/factory/card_Function.dart';
import 'package:flutter_legao/common/templates/floors/viewModel/floor.dart';
class CardFactory{
  static CardFactory get instance => _sharedInstance();

  // 静态私有成员，没有初始化
  static CardFactory? _instance;

  // 私有构造函数
  CardFactory._();

  // 静态、同步、私有访问点
  static CardFactory _sharedInstance() {
    _instance ??= CardFactory._();
    return _instance!;
  }

  final Map<String, dynamic> _cardMap = <String, dynamic>{};
  Map<String, dynamic> get cardMap => _cardMap;
  final Map<String, dynamic> _cardViewMap  = <String, dynamic>{};
  Map<String, dynamic> get cardViewMap => _cardViewMap;
  initCardAndViewMap() async {
    var result = await rootBundle
        .loadString(
        'lib/common/templates/resources/cardType.json');
    List<dynamic> resList = jsonDecode(result);
    configCardMap(resList);
  }
  void configCardMap(List<dynamic> resList){

    for(Map<String, dynamic> itemMap in resList){
      String key = itemMap['cardType'] as String;
      String cardString = itemMap['cardModel'] as String;
      _cardMap[key] = cardString;
      String? cardViewString = itemMap['cardView'] as String?;
      if (cardViewString != null){
        _cardViewMap[key] = cardViewString;
      }
    }
  }
  Future<List<CardModel>> getCardList(List json) async {
    List<CardModel> resultList = <CardModel>[];
    int i = 0;

    for (Map<String, dynamic> cardDataMap in json){
      CardModel? cardModel = await getCard(cardDataMap);
      if (cardModel != null){
        cardModel.index = i;
        resultList.add(cardModel);
      }
      i++;
    }

    return resultList;
  }

  Future<CardModel?> getCard(Map<String, dynamic> cardDataMap) async{

    print("1");
    if (cardDataMap['cardType'] == null) {
      return null;
    }
    print("2");
    print(cardMap);
    if (cardMap[cardDataMap['cardType']] == null){
      return null;
    }
    print("3");
    CardModel? cardModel = CardFunction.instance.getCardInstance(cardMap, cardViewMap, cardDataMap) ;
    if (cardModel?.subCardList != null){
      List<Map<String,dynamic>> subMapList = cardModel?.subCardList! as List<Map<String,dynamic>>;
      cardModel?.subCardModelList = await getCardList(subMapList);
    }
    print("4");
    print(cardModel);
    return cardModel;
  }

  List<CardView> getCardViewList(List<CardModel>? cardList,Floor? floor){
    List<CardView> resultList = [];
    if (cardList == null) {
      return resultList;
    }
    for (CardModel cardModel in cardList){
        CardView? cardView = getCardView(cardModel,floor);
        if (cardView != null){
          resultList.add(cardView);
        }
    }

    return resultList;
  }

  CardView? getCardView(CardModel? cardModel,Floor? floor){
    CardView? cardView = CardFunction.instance.getCardViewInstance(cardModel,floor);
    return cardView;
  }
}