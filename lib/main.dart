import 'package:flutter/material.dart';
import 'package:tops_project_greet_admin/screens/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E wishes',
      home: SplashScreen(),
    );
  }
}
