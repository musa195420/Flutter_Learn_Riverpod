// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:learn/item_provider.dart';

// TextEditingController controller = TextEditingController();

// class ItemClass extends ConsumerWidget {
//   const ItemClass({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Item Has Been Got"),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Enter item',
//               ),
//             ),
//           ),
//           Expanded(
//             child: Consumer(builder: (context, ref, child) {
//               final items = ref.watch(itemProvider);
//               return ListView.builder(
//                 itemCount: items.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: IconButton(
//                         onPressed: () {
//                           ref
//                               .read(itemProvider.notifier)
//                               .addItem(items[index].name);
//                         },
//                         icon: Icon(Icons.control_point_duplicate)),
//                     title: Text(items[index].name),
//                     trailing: IconButton(
//                         onPressed: () {
//                           ref
//                               .read(itemProvider.notifier)
//                               .remove(items[index].id);
//                         },
//                         icon: Icon(
//                           Icons.delete,
//                           color: Colors.red,
//                         )),
//                   );
//                 },
//               );
//             }),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           ref.read(itemProvider.notifier).addItem(controller.text);
//           controller.clear();
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
