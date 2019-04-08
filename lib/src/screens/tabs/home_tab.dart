import 'dart:ui';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zando_art/src/models/app_state.dart';
import 'package:zando_art/src/screens/commande_screen.dart';
import 'package:zando_art/src/screens/post_screen.dart';
import 'package:zando_art/src/app/detail.dart';
import 'package:zando_art/src/app/public.dart';
import 'package:zando_art/src/supplementals/colors.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(context) {
    return Scaffold(
      body: _buildHomeTab(context),
      floatingActionButton: _buildFloatingActionBtn(),
    );
  }

  Future<List> artistExist() async {
    final response = await http.get("http://192.168.43.30:80/zando_art_web/artiste_exist.php?email=${publicUser.email}");
    return json.decode(response.body);
  }

  // Retourne les données de la base des données via une page php
  Future<List> getData() async {
    final response = await http.get("http://192.168.43.30:80/zando_art_web/get_products.php");
    return json.decode(response.body);
  }

  FutureBuilder<List> _buildHomeTab(BuildContext context) => FutureBuilder(
    future: getData(),
    builder: (context, snapshot) {
      if (snapshot.hasError) print(snapshot.error);
      return snapshot.hasData ? ItemList(list: snapshot.data) : Center(
          child: CircularProgressIndicator(backgroundColor: ZandoMainColor, )
      );
    },
  );

  FutureBuilder<List> _buildFloatingActionBtn() => FutureBuilder(
    future: artistExist(),
    builder: (context, snapshot) {
      if(snapshot.hasError) print(snapshot.error);
      return snapshot.hasData ? FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 5.0,
        backgroundColor: ZandoMainColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PostScreen(user: publicUser,),
              )
          );
        },
      ) : FloatingActionButton(
        child: Icon(Icons.shopping_basket),
        elevation: 5.0,
        backgroundColor: ZandoMainColor,

        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CommandeScreen(user: publicUser,),
              )
          );
        },
      );
    },
  );
}

class ItemList extends StatelessWidget {

  final List list;
  const ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 3),
          child: _buildOnePost(i, context),
        );
      },
    );
  }

  _addToShoppingCart() {
    var url = "http://192.168.43.30:80/zando_art_web/add_to_shopingcart.php";

    /*
    http.post(url, body: {
      "firstname": _firstNameController.text,
      "lastname": _secondNameController.text,
      "password" : _firstPasswordController.text,
      "email" : _emailController.text,
    });
     */
  }



  Widget _buildOnePost(int i, BuildContext context) => Container(
    color: ZandoBGColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 2),
          child: Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: GestureDetector(
                  child: Image.network(
                    'http://192.168.43.30:80/zando_art_web/uploads/${list[i]["main_image"]}',
                    height: 200.0,
                    fit: BoxFit.fitWidth,
                  ),
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Detail(list: list, index: i,),
                      ),
                    );
                  },
                ),
              ),


            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.favorite_border, color: ZandoMainColor,),
                  SizedBox(width: 16.0),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Detail(list: list, index: i,),
                        ),
                      );
                    },
                    icon: Icon(Icons.bookmark, color: ZandoMainColor,),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  _addToShoppingCart();
                },
                icon: Icon(Icons.add_shopping_cart, color: ZandoMainColor),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            children: <Widget>[
              Text("${list[i]["name_prod"]} : ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("${list[i]["description_prod"]}"),
            ],
          ),
        ),
        SizedBox(height: 4,),
      ],
    ),
  );
}
