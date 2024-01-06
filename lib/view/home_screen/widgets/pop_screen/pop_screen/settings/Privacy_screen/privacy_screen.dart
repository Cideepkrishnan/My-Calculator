import 'package:flutter/material.dart';
import 'package:my_calculator/view/home_screen/widgets/pop_screen/pop_screen/settings/Privacy_screen/privacy_notes/privacy_notes.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy"),
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 88, 86, 86), borderRadius: BorderRadius.circular(14)),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrivacyNotice(),
                      ));
                },
                child: ListTile(
                  title: Text(
                    "Privacy Notice",
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
