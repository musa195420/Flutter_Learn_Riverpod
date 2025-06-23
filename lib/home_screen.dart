import 'package:flutter/material.dart';

final hello = Provider();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
