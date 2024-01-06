import 'package:flutter/material.dart';
import 'package:my_calculator/view/home_screen/widgets/pop_screen/pop_screen/settings/About_screen/Liscence_screen/about_screen.dart';
import 'package:my_calculator/view/home_screen/widgets/pop_screen/pop_screen/settings/Privacy_screen/privacy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
        elevation: 0,
        title: Text("settings"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 88, 86, 86),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Version",
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text("1.0.0"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutScreen(),
                          ));
                    },
                    child: ListTile(
                      title: Text(
                        "About",
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrivacyScreen(),
                          ));
                    },
                    child: ListTile(
                      title: Text(
                        "Privacy",
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
