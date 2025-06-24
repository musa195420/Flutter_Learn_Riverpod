import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/favourite_provider.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              ref.read(favouriteProvider.notifier).filterList(value);
            },
          ),
          Consumer(builder: (context, ref, child) {
            final provider = ref.watch(favouriteProvider);
            return Expanded(
              child: ListView.builder(
                itemCount: provider.filteredItems.length,
                itemBuilder: (context, index) {
                  final item = provider.filteredItems[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: InkWell(
                      onTap: () {
                        ref
                            .read(favouriteProvider.notifier)
                            .addToFavourites(item.id, !item.favourite);
                      },
                      child: Icon(
                        item.favourite
                            ? Icons.favorite // filled heart
                            : Icons.favorite_border,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
