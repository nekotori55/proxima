import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/player'),
        child: Icon(Icons.play_arrow_outlined),
      ),
      body: Center(child: Text("Empty Home Screen"),),
    );
  }
}
