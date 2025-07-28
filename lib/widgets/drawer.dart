import 'package:flutter/material.dart';
import 'package:flutterdemo/main.dart';

import '../screens/apply.dart';

class CADrawer extends StatelessWidget {
  final bool homepageActive;
  final bool firstPageActive;

  const CADrawer({
    super.key,
    this.homepageActive = false,
    this.firstPageActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 235,
      child: ListView(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (context) => MyApp()),
              );
            },
            child: (homepageActive == true) ? ListTile(title: Text(
                "Homepage", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)))
                : ListTile(title: Text("Homepage")),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(builder: (context) => FirstPage()),
                );
              },
              child: (firstPageActive == true) ? ListTile(title: Text(
                  "Apply", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)))
              : ListTile(title: Text("Apply")),
          ),
        ],
      ),
    );
  }
}
