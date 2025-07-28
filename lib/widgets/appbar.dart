import 'package:flutter/material.dart';

class CAAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CAAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      foregroundColor: Colors.white,
      title: RichText(
        text: TextSpan(
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          children: [
            TextSpan(text: "C"),
            TextSpan(
              text: "o",
              style: TextStyle(color: Colors.blue),
            ),
            TextSpan(text: "de Architects"),
          ],
        ),
      ),
      centerTitle: true,
      leadingWidth: 100,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
