import 'card_jumpData.dart';
class CardModel {
  late String cardType;
  String? trackInfo;
  JumpData? jumpData;
  int? index;
  String? linkCardViewName;
  List<Object>? subCardList;
  List<Object>? subCardModelList;
  CardModel({required this.cardType, this.trackInfo, this.jumpData,this.index,this.linkCardViewName,this.subCardList});
  List<T> getTypeSubModelList<T> () {
    List<T> result = [];
    subCardModelList?.forEach((element) {
      if (element is T) {
        result.add(element as T);
      }
    });
    return result;
  }
}


