
import 'package:flutter_legao/common/templates/cards/view/card_view.dart';
import 'package:flutter_legao/common/templates/floors/view/floor_view.dart';
import 'package:flutter_legao/common/templates/floors/viewModel/floor.dart';

typedef FloorCreator = FloorView Function(Floor floor,List<CardView>? cardViews);
class FloorFunction{
  static FloorFunction get instance => _sharedInstance();

  // 静态私有成员，没有初始化
  static FloorFunction? _instance;

  // 私有构造函数
  FloorFunction._() {
    functionViewMap = <String, dynamic>{};
  }

  // 静态、同步、私有访问点
  static FloorFunction _sharedInstance() {
    _instance ??= FloorFunction._();
    return _instance!;
  }

  // Map<String,Function(Map<String, dynamic>)>? _functionViewMap;
  late Map<String,dynamic>  functionViewMap;
  void registerFloorViewFunction(Map<String, dynamic > fuctionsMap) {
    for (String name in fuctionsMap.keys){
      if (!functionViewMap.containsKey(name)) {
        functionViewMap[name] = fuctionsMap[name];
      }
    }
  }
  dynamic getFloorViewInstance(Map<String, dynamic> map, Floor floor,{List<CardView>? cardViews}) {
    if (map[floor.floorType] == null){
      return null;
    }
    if (functionViewMap[map[floor.floorType]] == null) {
      return null;
    }
    Function function = functionViewMap[map[floor.floorType]] as Function;
    if (cardViews != null){
      dynamic result  = function.call(floor,cardViews);
      return result;
    }
    else{
      dynamic result  = function.call(floor);
      return result;
    }
  }
  dynamic getSingleFloorViewInstance(Map<String, dynamic> map, Floor floor) {
    if (map[floor.floorType] == null){
      return null;
    }
    if (functionViewMap[map[floor.floorType]] == null) {
      return null;
    }
    Function function = functionViewMap[map[floor.floorType]] as Function;
    dynamic result  = function.call(floor);
    return result;
  }

}