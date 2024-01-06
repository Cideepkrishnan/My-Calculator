import 'package:flutter/material.dart';

class LiscenceScreen extends StatelessWidget {
  const LiscenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Open source liscence"),
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
        elevation: 0,
      ),
    );
  }
}
