import 'package:flutter/material.dart';
import 'package:flutter_legao/common/templates/cards/view/card_view.dart';
import 'package:flutter_legao/common/templates/floors/viewModel/floor.dart';
class FloorView extends StatefulWidget{
   final Floor? floor;
   final Widget? parentContainer;
   final Widget? parentView;
   final int? index;
   final List<CardView>? cardViews;

  // FloorView({Key? key}) : super(key: key);
  const FloorView({Key? key, this.floor, this.parentContainer, this.parentView, this.index, this.cardViews}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
  double getFloorViewHeight(){
    return 0;
  }
}