import 'package:flutter/material.dart';
import 'package:world_time_app/pages/loading.dart';
import './pages/home.dart';
import './pages/locations.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/locations': (context) => const Locations(),
      },
    );
  }
}
