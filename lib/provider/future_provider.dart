import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<String>((ref) async {
  await Future.delayed(Duration(seconds: 6));
  return ("Hi");
});
