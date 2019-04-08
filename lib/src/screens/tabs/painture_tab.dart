import 'package:flutter/material.dart';

class PaintureTab extends StatefulWidget {
  @override
  _PaintureTabState createState() => _PaintureTabState();
}

class _PaintureTabState extends State<PaintureTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.shopping_basket),
      ),
    );
  }
}
