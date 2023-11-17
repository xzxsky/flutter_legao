
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_legao/common/templates/cards/view/card_view.dart';
import 'package:flutter_legao/common/templates/cards/viewModel/card.dart';
import 'package:flutter_legao/common/templates/factory/card_factory.dart';
import 'package:flutter_legao/common/templates/factory/floor_Function.dart';
import 'package:flutter_legao/common/templates/floors/view/floor_view.dart';
import 'package:flutter_legao/common/templates/floors/viewModel/floor.dart';
class FloorFactory{
  static FloorFactory get instance => _sharedInstance();

  // 静态私有成员，没有初始化
  static FloorFactory? _instance;

  // 私有构造函数
  FloorFactory._();

  // 静态、同步、私有访问点
  static FloorFactory _sharedInstance() {
    _instance ??= FloorFactory._();
    return _instance!;
  }
  final Map<String, dynamic> _floorViewMap = <String, dynamic>{};
  Map<String, dynamic> get floorViewMap => _floorViewMap;
  initFloorMap() async {
    var result = await rootBundle
        .loadString(
        'lib/common/templates/resources/floorType.json');
    List<dynamic> resList = jsonDecode(result);
    for(dynamic itemMap in resList){
      String key = itemMap['floorType'] as String;
      String value = itemMap['floorView'] as String;
      _floorViewMap[key] = value;
    }
    return _floorViewMap;
  }
  Future<List<Floor>> getFloorList(List<dynamic> json) async {
    List<Floor> resultList = [];
    for(Map<String, dynamic> map in json){
      Floor? floor = await getFloor(map);
      if (floor != null){
        resultList.add(floor);
      }
    }
    return resultList;
  }

  Future<Floor?> getFloor(Map<String, dynamic> floorDataMap) async {
    if (floorDataMap['floorType'] == null) {
      return null;
    }

    Floor? floor = Floor(floorType: floorDataMap['floorType'] as String);
    if (floorDataMap['cardList'] != null){
      floor.cardList = await CardFactory.instance.getCardList(floorDataMap['cardList'] as List);
       // floor.cardList = cardList ; //肯定不为空

    }

    print("floor log");
    print(floor.cardList);
    return floor;
  }

  List<FloorView> getFloorViewList(List<Floor> floorList) {
    List<FloorView> resultList = [];
    int i = 0;
    for (Floor floor in floorList){
      floor.index = i;
      FloorView? floorView = getFloorView(floor);
      if (floorView != null){
        resultList.add(floorView);
      }
      i++;
    }
    return resultList;
  }

  FloorView? getFloorView(Floor? floor) {
    if (floor == null) {
      return null;
    }
    Map<String, dynamic> viewMap = floorViewMap;
    List<CardView>? cardViews;
    if (floor.cardList != null){
      cardViews = CardFactory.instance.getCardViewList(floor.cardList as List<CardModel>, floor);
    }
    FloorView? floorView = FloorFunction.instance.getFloorViewInstance(viewMap,floor,cardViews:cardViews);
    return floorView;
  }
  /*
   * @Author: a1
   * @Date: 2023/1/1
   * @Description: 纯floorViewlist
   */
  List<FloorView> getSingleFloorViewList(List<Floor> floorList) {
    List<FloorView> resultList = [];
    int i = 0;
    for (Floor floor in floorList){
      floor.index = i;
      FloorView? floorView = getSingleFloorView(floor);
      if (floorView != null){
        resultList.add(floorView);
      }
      i++;
    }
    return resultList;
  }
  /*
   * @Author: a1
   * @Date: 2023/1/1
   * @Description: 此方法只适合内部只有一个card的场景，只获取floorView，不在内部生成cardView,但需要解析cardModel
   */
  FloorView? getSingleFloorView(Floor? floor) {
    if (floor == null) {
      return null;
    }
    Map<String, dynamic> viewMap = floorViewMap;
    // List<CardView>? cardViews;
    // if (floor.cardList != null){
    //   cardViews = CardFactory.instance.getCardViewList(floor.cardList as List<CardModel>, floor);
    // }
    FloorView? floorView = FloorFunction.instance.getFloorViewInstance(viewMap,floor);
    return floorView;
  }

}