import 'package:flutter/material.dart';
import 'package:zando_art/src/constants/color.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Material(
        //Content of tabs
        child: PageView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: ZandoBGColor,
                  ),
                  padding: const EdgeInsets.all(18.0),
                  child: Text('A propos de Zando Art'),
                ),
              ],
            )
          ],
        ),
      );
}
