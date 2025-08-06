import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn/slider_provider.dart';

//To read Contant Value No State Changes

class ItemScreen extends ConsumerWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("Whole Widget Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Column(
        children: [
          Text("Color Box"),
          Consumer(
            builder: (context, ref, child) {
              debugPrint("Slider Rebuild");
              final slider = ref.watch(sliderProvider);
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      final stateProvider = ref.read(sliderProvider.notifier);
                      stateProvider.state =
                          slider.copyWith(showPassword: !slider.showPassword);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          color:
                              slider.showPassword ? Colors.red : Colors.green,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.red.withOpacity(slider.slider),
                  ),
                  Slider(
                    value: slider.slider,
                    onChanged: (value) {
                      final stateProvider = ref.read(sliderProvider.notifier);
                      stateProvider.state =
                          stateProvider.state.copyWith(slider: value);
                    },
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

// final counter = StateProvider<int>((ref) {
//   return 0;
// });
// final switchProvider = StateProvider<bool>((ref) {
//   return false;
// });

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     //final subscribe = ref.watch(hello);
//     debugPrint("Build Widget");
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   color: Colors.blueAccent,
//                   child: InkWell(
//                     onTap: () {
//                       ref.read(counter.notifier).state++;
//                     },
//                     child: Text(
//                       "+",
//                       style: TextStyle(fontSize: 50),
//                     ),
//                   ),
//                 ),
//                 Consumer(builder: (context, ref, child) {
//                   final count = ref.watch(counter);
//                   return Text(count.toString());
//                 }),
//                 Container(
//                   color: Colors.blueAccent,
//                   child: InkWell(
//                     onTap: () {
//                       ref.read(counter.notifier).state--;
//                     },
//                     child: Text(
//                       "-",
//                       style: TextStyle(fontSize: 50),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Consumer(builder: (context, ref, child) {
//               debugPrint("Switch Builder");
//               final switchValue = ref.watch(switchProvider);
//               return Switch(
//                 value: switchValue,
//                 onChanged: (value) {
//                   ref.read(switchProvider.notifier).state = value;
//                 },
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }

//<===========================================================Old Code==============================================================>
// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final subscribe = ref.watch(hello);
//     final tempAge = ref.watch(age);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Text(
//           "$subscribe $tempAge",
//           style: TextStyle(fontSize: 50),
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final subscribe = ref.watch(hello);
//     final tempAge = ref.watch(hello);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Text(
//           subscribe,
//           style: TextStyle(fontSize: 50),
//         ),
//       ),
//     );
//   }
// }
