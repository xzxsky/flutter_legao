import 'package:flutter/material.dart';
import 'package:flutter_legao/common/templates/cards/viewModel/card.dart';
import 'package:flutter_legao/common/templates/floors/viewModel/floor.dart';
class CardView extends StatefulWidget{
  final CardModel? cardModel;
  final Floor? floor;
  final Widget? parentView;
  final int? index;

  const CardView({Key? key, this.cardModel, this.floor, this.parentView, this.index}) : super(key: key);

  @override

  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
