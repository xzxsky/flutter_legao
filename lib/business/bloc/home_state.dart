part of 'home_bloc.dart';

abstract class HomeState  {
  const HomeState();
}
class HomeStateInitial extends HomeState {}
class HomeStateLoading extends HomeState {}
class HomeStateSuccess extends HomeState{
  final FloorModel? floorModel;
  final dynamic homeModel;
  HomeStateSuccess({this.floorModel, this.homeModel});
  HomeStateSuccess copyWith({FloorModel? floorModel }) {
    return HomeStateSuccess(
        floorModel: floorModel ?? this.floorModel);
  }
}
class HomeStateFail extends HomeState{
  final NetErrorModel? netErrorModel;
  const HomeStateFail({this.netErrorModel});
  HomeStateFail copyWith({NetErrorModel? netErrorModel}) {
    return HomeStateFail(
        netErrorModel: netErrorModel ?? this.netErrorModel);
  }
}
class HomeStateEmpty extends HomeState{
  const HomeStateEmpty();
}