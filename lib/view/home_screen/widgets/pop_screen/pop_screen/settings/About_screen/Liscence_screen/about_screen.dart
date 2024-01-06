import 'package:flutter/material.dart';
import 'package:my_calculator/view/home_screen/widgets/pop_screen/pop_screen/settings/About_screen/Liscence_screen/open_source_liscence/liscence_screen.dart';

import '../../Privacy_screen/privacy_notes/privacy_notes.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/image/calc.png"),
                    radius: 30,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Calculator",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "1.0.0",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 88, 86, 86),
                          borderRadius: BorderRadius.circular(14)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LiscenceScreen(),
                              ));
                        },
                        child: ListTile(
                          title: Text("Open source liscence"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
