import 'package:flutter/material.dart';
import '../../src/supplementals/colors.dart';

Widget buildAppBar() {
  return AppBar(
    title: Center(
      child: Text('Zando Art'),
    ),
    backgroundColor: ZandoMainColor,

    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.search,
          semanticLabel: 'search',
        ),
        onPressed: () {
          print('Search button');
        },
      ),
    ],
  );
}