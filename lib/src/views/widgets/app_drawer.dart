import 'package:flutter/material.dart';

import '/src/constants/route.dart' as App;

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            // accountName: Text('${publicUser.firstname} ${publicUser.lastname}'),
            // accountEmail: Text('${publicUser.email}'),
            accountName: Text('Username'),
            accountEmail: Text('username@email.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/user.jpeg"),
            ),
            decoration: BoxDecoration(
                //color: ZandoMainColor,
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
              Navigator.pushNamed(context, App.Route.category);
            },
          ),
          ListTile(
            title: Text("Mon compte"),
            trailing: Icon(Icons.account_circle),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (BuildContext context) => ProfileScreen(
              //         user: publicUser,
              //       ),
              //     ));
            },
          ),
          ListTile(
            title: Text("Commandes"),
            trailing: Icon(Icons.shopping_basket),
            onTap: () {
              Navigator.pushNamed(context, App.Route.orders);
            },
          ),
          ListTile(
            title: Text("A Propos"),
            trailing: Icon(Icons.info),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => About()));
            },
          ),
        ],
      ),
    );
  }
}
