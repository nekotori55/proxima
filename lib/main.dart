import 'package:flutter/material.dart';
import 'package:proxima/ui/pages/home/home.dart';
import 'package:proxima/ui/pages/player/player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proxima',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
      ),
      // home: const Player(),
      home: HomeScreen(),
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/player': (BuildContext context) => Player()
      }
    );
  }
}
