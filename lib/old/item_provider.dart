// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:learn/item.dart';

// final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
//   return ItemNotifier();
// });

// class ItemNotifier extends StateNotifier<List<Item>> {
//   ItemNotifier() : super([]);

//   void addItem(String itemname) {
//     final item = Item(id: DateTime.now().toString(), name: itemname);
//     state.add(item);
//     state = state.toList();
//   }

//   void remove(String itemid) {
//     state.removeWhere((item) {
//       return item.id == itemid;
//     });
//     state = state.toList();
//   }
// }
