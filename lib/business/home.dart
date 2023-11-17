import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_legao/business/bloc/home_bloc.dart';
import 'package:flutter_legao/common/templates/factory/floor_factory.dart';
import 'package:flutter_legao/common/templates/model/floor_model.dart';

class HomePage extends StatefulWidget {
  final Map<String, dynamic>? params;
  const HomePage({Key? key, this.params}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  FloorModel? floorModel;
  late String orderNo;
  late int insuranceType;
  late final HomeBloc pageBloc;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    pageBloc = HomeBloc();
    scrollController.addListener(() {
    });

  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }


  Widget buildBody(BuildContext context) {
    // if (detailData == null){
    //   return Container();
    // }
    return BlocProvider(
      create: (_) => pageBloc..add(const HomeGetEvent()),
      child: BlocBuilder<HomeBloc,HomeState>(
        builder: (context,state){
          if (state is HomeStateInitial){ // 初始化loading
            return Container();
            // return PageLoadingView(imageName: 'insurance_order_detail_loading.png', path: 'insurance',);
          }
          else if (state is HomeStateFail){ // 错误或者为空
            return Container();
            // return EmptyOrFailureView(
            //   loadingState: LoadingState.failure,
            //   reload: () {
            //     myAsyncRefreshFunction();
            //   },
            //   errorModel: state.netErrorModel,
            // );
          }
          else if (state is HomeStateEmpty)
          {
            return Container(

            );
          }
          else if (state is HomeStateSuccess){
            floorModel = state.floorModel;
            if (floorModel?.floorList != null) {
              return Column(
                children: [
                  Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            margin: EdgeInsets.zero,
                            child: RefreshIndicator(
                              onRefresh: myAsyncRefreshFunction,
                              child: buildList(),
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              );
            }
          }
          return Container();
        },
      ),
      // ),
    );
  }
  Widget buildList(){
    if (floorModel?.floorList == null) {
      return Container();
    }
    List<Widget> widgets = FloorFactory.instance.getSingleFloorViewList(floorModel!.floorList!);
    if (widgets.isEmpty){
      return Container();
    }
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: scrollController,
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int index) {
        if (index < widgets.length){
          return widgets[index];
        }
        return Container();
      },
    );
  }
  Future<void> myAsyncRefreshFunction() async{
    pageBloc.add(const HomeGetEvent());
  }
}