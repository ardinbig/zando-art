import 'package:flutter/material.dart';

class SalesTab extends StatefulWidget {
  @override
  _SalesTabState createState() => _SalesTabState();
}

class _SalesTabState extends State<SalesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.shopping_basket),
      ),
    );
  }
}
