
import 'package:flutter_legao/common/templates/factory/floor_factory.dart';
import 'package:flutter_legao/common/templates/floors/viewModel/floor.dart';

class FloorModel {
  final String? pageId;
  final String? pageTitle;
  final String? trackInfo;
  List<Floor>? floorList;

  FloorModel({this.pageId, this.pageTitle, this.trackInfo});
  static Future<FloorModel> fromJson(Map<String, dynamic> json) async{
    FloorModel floorModel = FloorModel(pageId: json['pageId'] as String?,pageTitle: json['pageTitle'] as String?,trackInfo: json['trackInfo'] as String?);
    if (json['floorList'] != null){
        floorModel.floorList = await FloorFactory.instance.getFloorList(json['floorList'] as List);
    }
    return floorModel;
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['pageId'] = pageId;
    map['pageTitle'] = pageTitle;
    map['trackInfo'] = trackInfo;
    map['floorList'] = floorList?.toList();
    return map;
  }
  @override
  String toString() {
    return 'FloorModel{pageId: $pageId, pageTitle: $pageTitle,trackInfo: $trackInfo, floorList: $floorList.toString()}';
  }
}