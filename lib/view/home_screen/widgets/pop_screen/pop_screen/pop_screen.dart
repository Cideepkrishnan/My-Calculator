import 'package:flutter/material.dart';
import 'package:my_calculator/view/home_screen/widgets/pop_screen/pop_screen/settings/settings_screen.dart';

class Pop_screen extends StatelessWidget {
  const Pop_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
          side: BorderSide.none, borderRadius: BorderRadius.circular(15)),
      itemBuilder: (context) => [
        PopupMenuItem(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ));
            },
            child: Text("Settings"))
      ],
    );
  }
}
