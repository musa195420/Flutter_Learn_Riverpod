// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn/routes/app_route_contants.dart';
import 'package:learn/search_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("Whole Widget Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).search(value);
            },
          ),
          Consumer(builder: (context, ref, child) {
            debugPrint("Text Rebuild");
            final search = ref.watch((searchProvider).select((state) {
              return state.search;
            }));
            return Text(search.toString());
          }),
          Consumer(builder: (context, ref, child) {
            debugPrint("Button Rebuild");

            final isChange = ref.watch((searchProvider).select((state) {
              return state.isChanged;
            }));
            return Switch(
              value: isChange,
              onChanged: (value) {
                ref.read(searchProvider.notifier).onChange(value);
              },
            );
          }),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context)
                    .pushReplacementNamed(MyAppRouteConstants.itemRoute);
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Item Page")))
        ],
      ),
    );
  }
}
