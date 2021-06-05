import 'package:flutter/material.dart';
import 'package:zando_art/src/models/user.dart';
import 'package:zando_art/src/utils/colors.dart';

class OrdersScreen extends StatefulWidget {
  final User? user;

  OrdersScreen({this.user});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
        backgroundColor: ZandoMainColor,
      ),
      body: Container(),
    );
  }
}
