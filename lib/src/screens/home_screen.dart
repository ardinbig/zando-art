import 'dart:io';
import 'package:flutter/material.dart';
import 'package:zando_art/src/models/user.dart';
import '../../src/supplementals/colors.dart';
import '../../src/widgets/app_bar.dart';
import '../../src/widgets/navigation_bar.dart';
import '../../src/screens/profile_screen.dart';
import '../../src/screens/commande_screen.dart';
import '../../src/screens/about.dart';
import 'package:zando_art/src/app/public.dart';
import '../../src/screens/category_screen.dart';
import '../../src/screens/tabs/shopping_cart_tab.dart' as shopping_cart;
import '../../src/screens/tabs/home_tab.dart' as home;
import '../../src/screens/tabs/notification_tab.dart' as notification;

class HomeScreen extends StatefulWidget {

  final User user;

  HomeScreen({this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState(user: user);

}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  TabController controller;

  final User user;

  File _image;

  _HomeScreenState({this.user});

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    publicUser = user;
    publicEmail = user.email;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildTabBarView(),
      bottomNavigationBar: _buildTabs(),
      
    );
  }

  TabBarView _buildTabBarView() => TabBarView(
    controller: controller,
    children: <Widget>[
      home.HomeTab(),
      shopping_cart.ShoppingCartTab(),
      notification.NotificationTab(),
    ],
  );


  Material _buildTabs() {
    return Material(
      color: ZandoMainColor,
      child: buildNavigationBar(controller),
    );
  }

  /// TODO: Implement search

  switchUser() {
    this.setState(() {

    });
  }

  Widget _buildDrawer() => Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('${publicUser.firstname} ${publicUser.lastname}'),
          accountEmail: Text('${publicUser.email}'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("assets/images/user.jpeg"),
          ),
          decoration: BoxDecoration(
            color: ZandoMainColor,
          ),
        ),
        ListTile(
          title: Text("Accueil"),
          trailing: Icon(Icons.home),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text("Categories"),
          trailing: Icon(Icons.widgets),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => CategoryScreen())
            );
          },
        ),
        ListTile(
          title: Text("Mon compte"),
          trailing: Icon(Icons.account_circle),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => ProfileScreen(user: publicUser,),
                )
            );
          },
        ),
        ListTile(
          title: Text("Commandes"),
          trailing: Icon(Icons.shopping_basket),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => CommandeScreen(user: publicUser,),
                )
            );
          },
        ),
        ListTile(
          title: Text("A Propos"),
          trailing: Icon(Icons.info),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => About())
            );
          },
        ),
      ],
    ),
  );
}






