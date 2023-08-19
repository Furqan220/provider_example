import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _favItems = [];
  List<int> get favItems => _favItems;

  void markFav(int item) {
    _favItems.add(item);
    notifyListeners();
  }

  void unmarkFav(int item) {
    _favItems.remove(item);
    notifyListeners();
  }
}
