import 'package:flutter/material.dart';

import '/src/constants/color.dart';
import '/src/models/user.dart';
import '/src/views/widgets/app_drawer.dart';
import '../tabs/home_tab.dart' as home;
import '../tabs/notification_tab.dart' as notification;
import '../tabs/shopping_cart_tab.dart' as shopping_cart;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  User? user;

  // File? _image;

  //_HomeScreenState({required this.user});

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    //publicUser = user;
    //publicEmail = user.email;
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zando Art'),
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
      ),
      drawer: AppDrawer(),
      body: _buildTabBarView(),
      bottomNavigationBar: _buildTabs(),
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: controller,
      children: <Widget>[
        home.HomeTab(),
        shopping_cart.ShoppingCartTab(),
        notification.NotificationTab(),
      ],
    );
  }

  Material _buildTabs() {
    return Material(
      color: ZandoMainColor,
      child: TabBar(
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
      ),
    );
  }

  switchUser() {
    this.setState(() {});
  }
}
