import 'package:flutter/cupertino.dart';
import 'package:flutter_legao/business/cards/model/banner_cardModel.dart';
import 'package:flutter_legao/common/templates/cards/view/card_view.dart';
import 'package:flutter_legao/common/templates/floors/view/floor_view.dart';
import 'package:flutter_legao/common/templates/floors/viewModel/floor.dart';

import '../../../../../common/templates/factory/card_factory.dart';

class BannerFloorView extends FloorView{

  factory BannerFloorView.createInstance(Floor floor){

    return BannerFloorView(key: ObjectKey(floor),floor:floor,index:floor.index);
  }
  // const InsuranceDetailHeaderFloorView({Key? key}) : super(key: key);
  const BannerFloorView({Key? key,
    Floor? floor,
    Widget? parentContainer,
    Widget? parentView,
    int? index,
    List<CardView>? cardViews}) :super(key: key,
      floor: floor,
      parentContainer: parentContainer,
      parentView: parentView,
      index: index,
      cardViews: cardViews);
  @override
  State<StatefulWidget> createState() {
    return _BannerFloorViewState();
  }
}
class _BannerFloorViewState extends State<BannerFloorView>{
  @override
  Widget build(BuildContext context) {
    BannerCardModel? cardModel = widget.floor?.cardList?.first as BannerCardModel?;
    if (cardModel == null){
      return Container();
    }
    double horWidth = 370;
    List<Widget> childList = <Widget>[];
    childList.add(
        Container(
          padding: const EdgeInsets.only(left:10, top: 10, right: 10, bottom: 10),
          width: horWidth,
          height: 42,
          alignment: Alignment.centerLeft,
          child: Text(cardModel.image?.url ?? ""),
        ));

    return Container(
      padding: const EdgeInsets.only(top: 0,left: 10,right: 10,bottom: 0),
      child: SizedBox(
        width: horWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: childList,
        ),
      ),
    );
  }
}