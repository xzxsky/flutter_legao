
import '../../cards/viewModel/card.dart';
class Floor  {
  late String floorType;
  String? totalPages;
  int? index;
  int? selectedIndex;
  String? linkElementViewName;
  List<CardModel>? headerCardList;
  List<CardModel>? cardList;
  List<CardModel>? footerCardList;
  Floor(
      {
        required this.floorType,
        this.totalPages,
        this.index,
        this.selectedIndex,
        this.linkElementViewName,
        this.headerCardList,
        this.cardList,
        this.footerCardList});

}

