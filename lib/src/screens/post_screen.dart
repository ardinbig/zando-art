import 'package:flutter/material.dart';

import '/src/models/user.dart';
import '/src/utils/colors.dart';

class PostScreen extends StatefulWidget {

  final User? user;

  PostScreen({this.user});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poste"),
        backgroundColor: ZandoMainColor,
      ),
      body: Container(

      ),
    );
  }
}
