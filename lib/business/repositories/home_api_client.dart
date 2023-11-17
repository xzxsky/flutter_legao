
import 'dart:convert';

import 'package:flutter/services.dart';

class HomeApiClient {
  Future<Map<String, dynamic>> getHomeData(
      {bool isMock = true }) async {
    Map<String, dynamic> response;
    try {
      if (isMock){
        // String requestUrl = 'https://mock.apifox.cn/m2/1579425-0-default/58379266?apifoxToken=4npPtajeSzv48rZjwx6EshWSJX5499OU';
        // response = await Networking.request(url: requestUrl, params: {'order_no':orderNo}, isGateWay: false, isMock: isMock,requestType: RequestType.get);
        final data = await rootBundle.loadString("assets/data/home.json");
        final jsonResult = jsonDecode(data.toString());
        response = jsonResult;
      }else{
        // 调用接口
        response = {};
      }
      return  response;
    } catch (_) {
      rethrow;
    }

  }
}