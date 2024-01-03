import 'package:flutter/material.dart';
import 'package:my_calculator/view/home_screen/home_screen.dart';
import 'package:my_calculator/view/splash_screen/splash_screen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
