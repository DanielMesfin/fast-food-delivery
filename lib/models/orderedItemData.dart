import 'package:flutter/cupertino.dart';

class OrderedItemData extends ChangeNotifier {
  List<Map<String, dynamic>> itemInBag = [];
  void addOrderedItem(Map<String, dynamic> itemToBeAdd) {
    itemInBag.add(itemToBeAdd);
    notifyListeners();
  }
// TODO these to set  the data sap more in the way tha it should be manipulated by progarmer sudenly
  // UnmodifiableListView<OrderedItemData> get getItem {
  //   return UnmodifiableListView(_itemInBag as Iterable<OrderedItemData>);
  // }
void isLoved(Map<String, dynamic> toBeLoved){
    toBeLoved['loved']=!toBeLoved['loved'];
    notifyListeners();
}


  int getCount() {
    return itemInBag.length;
  }

  double totalCostInCart() {
    double sum = 0.0;
    itemInBag.forEach((itemElement) {
      sum = sum + itemElement['totalPrice'];
    });
    return sum;
  }

  void removeItem(int id) {
    itemInBag.removeWhere((element) => element['id'] == id);
    notifyListeners();
  }

  void checkOutAll() {
    itemInBag.removeWhere((element) => true);
    notifyListeners();
  }
}
