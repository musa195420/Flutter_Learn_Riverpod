import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn/provider/favourite_states.dart';

import '../model/item.dart';

class FavouriteNotifier extends StateNotifier<FavouriteStates> {
  FavouriteNotifier()
      : super(FavouriteStates(allItems: [], filteredItems: [], search: ''));

  void addItem() {
    List<Item> item = [
      Item(name: 'MacBook', favourite: true, id: "1"),
      Item(name: 'Chromebook', favourite: false, id: "2"),
      Item(name: 'HP EliteBook', favourite: true, id: "3"),
      Item(name: 'Dell XPS 13', favourite: false, id: "4"),
      Item(name: 'Lenovo ThinkPad', favourite: true, id: "5"),
      Item(name: 'Asus ZenBook', favourite: false, id: "6"),
      Item(name: 'Microsoft Surface', favourite: true, id: "7"),
      Item(name: 'Acer Aspire 5', favourite: false, id: "8"),
      Item(name: 'Razer Blade', favourite: true, id: "9"),
      Item(name: 'LG Gram', favourite: false, id: "10"),
      Item(name: 'MSI Prestige', favourite: true, id: "11"),
      Item(name: 'Toshiba Tecra', favourite: false, id: "12"),
      Item(name: 'Samsung Galaxy Book', favourite: true, id: "13"),
      Item(name: 'Huawei MateBook', favourite: false, id: "14"),
      Item(name: 'Dell Inspiron', favourite: true, id: "15"),
    ];
    state =
        state.copyWith(allItems: item.toList(), filteredItems: item.toList());
  }

  void addToFavourites(String id, bool favourite) {
    state = state.copyWith(
      allItems: state.allItems.map((item) {
        if (item.id == id) {
          return item.copyWith(favourite: favourite);
        }
        return item;
      }).toList(),
    );
  }

  void filterList(String search) {
    state = state.copyWith(filteredItems: _filtered(state.allItems, search));
  }

  List<Item> _filtered(List<Item> items, String search) {
    if (search.isEmpty) {
      return items;
    }

    return items.where((item) {
      return item.name.toLowerCase().contains(search.toLowerCase());
    }).toList();
  }
}

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteStates>((ref) {
  return FavouriteNotifier();
});
