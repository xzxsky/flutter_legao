
import 'package:flutter_legao/business/repositories/home_api_client.dart';

class HomeRepository {
  final HomeApiClient client;
  HomeRepository({required this.client});
  Future<Map<String, dynamic>> getHomeData() async {
    Map<String, dynamic> resMap = await client.getHomeData(isMock: true);
    return resMap;
  }
}