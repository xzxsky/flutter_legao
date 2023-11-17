import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_legao/business/floors/home_floor_function.dart';
import 'package:flutter_legao/business/cards/home_card_function.dart';
import 'package:flutter_legao/business/repositories/home_api_client.dart';
import 'package:flutter_legao/business/repositories/home_repository.dart';
import 'package:flutter_legao/common/net_error_model.dart';
import 'package:flutter_legao/common/templates/factory/card_Function.dart';
import 'package:flutter_legao/common/templates/factory/floor_Function.dart';
import 'package:flutter_legao/common/templates/model/floor_model.dart';

part 'home_event.dart';
part 'home_state.dart';
class

HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super( HomeStateInitial()) {
    on<HomeGetEvent>((event, emit) async {
      FloorFunction.instance.registerFloorViewFunction(HomeFloorFunction.viewFunctionMap);
      CardFunction.instance.registerCardFunction(HomeCardFunction.functionMap);
      Map<String, dynamic> resMap = await repository.getHomeData();
      if (resMap['code'] == '0'){
        FloorModel floorModel = await FloorModel.fromJson(resMap['data']);
        emit(HomeStateSuccess(floorModel: floorModel));
        int floorCount = floorModel.floorList?.length ?? 0;
        if (floorCount > 0) {
          print("sky log floorList:");
          print(floorModel.floorList?.first);
          emit(HomeStateSuccess(floorModel: floorModel));
        }else{
          emit(const HomeStateEmpty());
        }
      } else {
        emit(HomeStateFail(netErrorModel: NetErrorModel.fromJson(resMap)));
      }
    });
  }
  final repository = HomeRepository(client: HomeApiClient());
}