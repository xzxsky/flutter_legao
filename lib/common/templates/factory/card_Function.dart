
import 'package:flutter_legao/common/templates/cards/viewModel/card.dart';
import 'package:flutter_legao/common/templates/factory/card_factory.dart';
import 'package:flutter_legao/common/templates/floors/viewModel/floor.dart';

class CardFunction{
  static CardFunction get instance => _sharedInstance();
  // 静态私有成员，没有初始化
  static CardFunction? _instance;
  // 私有构造函数
  CardFunction._() {
    functionMap = <String,Function(String, Map<String, dynamic>)>{};
    functionViewMap = <String,Function>{};
  }
  // 静态、同步、私有访问点
  static CardFunction _sharedInstance() {
    _instance ??= CardFunction._();
    return _instance!;
  }
  late Map<String,Function(String, Map<String, dynamic>)> functionMap ;
  late Map<String,Function> functionViewMap;

  void registerCardFunction(Map<String, dynamic > fuctionsMap) {
    for (String name in fuctionsMap.keys){
      if (!functionMap.containsKey(name)) {
        functionMap[name] = fuctionsMap[name];
      }
    }
  }
  void registerCardViewFunction(Map<String, dynamic > fuctionsMap) {
    for (String name in fuctionsMap.keys){
      if (!functionViewMap.containsKey(name)) {
        functionViewMap[name] = fuctionsMap[name];
      }
    }
  }
  dynamic getCardInstance(Map<String, dynamic> localCardMap,Map<String, dynamic> localCardViewMap, Map<String, dynamic> map) {
    Function(String, Map<String, dynamic>)? function = functionMap[localCardMap[map['cardType']]];
    print("functionMap");
    print(functionMap);
    print("function");
    print(function);

    print("localCardMap[map['cardType']]");
    print(localCardMap[map['cardType']]);
    if (function == null) {
      print("cardView 为空");
      return null;
    }

    Map<String, dynamic> propertys = map['props'];
    map.addAll(propertys);
    String cardView = "";
    if (localCardViewMap.containsKey(map['cardType'])) {
      cardView = localCardViewMap[map['cardType']];
    }
    dynamic result  = function.call(cardView, map);
    return result;
  }
  dynamic getCardViewInstance(CardModel? cardModel,Floor? floor) {
    if (cardModel == null) {
      return null;
    }
    String? cardViewName = CardFactory.instance.cardViewMap[cardModel.cardType];
    if (cardViewName == null){
      print("xiaoxiao  linkCardViewName is null : ${cardModel.cardType}-----${floor?.floorType}");
      return null;
    }
    Function? function = functionViewMap[cardViewName];
    if (function == null) {
      print("xiaoxiao  functionViewCall is null : ${cardModel.cardType}-----${floor?.floorType}");

      return null;
    }
    dynamic result  = function.call(cardModel,floor);
    return result;
  }

}