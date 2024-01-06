import 'package:flutter/material.dart';

class PrivacyNotice extends StatelessWidget {
  const PrivacyNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Notice"),
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
        elevation: 0,
      ),
    );
  }
}
