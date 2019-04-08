import 'package:flutter/material.dart';
import '../../src/supplementals/colors.dart';

Widget buildNavigationBar(TabController controller) {
  return TabBar(
    labelColor: Colors.white,
    indicatorColor: ZandoSecondaryColor,
    controller: controller,
    tabs: <Widget>[
      Tab(
        icon: Icon(Icons.home),
      ),
      Tab(
        icon: Icon(Icons.shopping_cart),
      ),
      Tab(
        icon: Icon(Icons.notifications),
      ),
    ],
  );
}