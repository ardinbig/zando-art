import 'package:flutter/material.dart';
import 'package:zando_art/src/models/user.dart';
import 'package:zando_art/src/supplementals/colors.dart';

class CommandeScreen extends StatefulWidget {

  final User user;

  CommandeScreen({this.user});

  @override
  _CommandeScreenState createState() => _CommandeScreenState();
}

class _CommandeScreenState extends State<CommandeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Commande"),
        backgroundColor: ZandoMainColor,
      ),
      body: Container(

      ),
    );
  }
}
