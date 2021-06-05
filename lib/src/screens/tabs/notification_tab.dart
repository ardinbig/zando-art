import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zando_art/src/models/app_state.dart';

class NotificationTab extends StatefulWidget {
  @override
  _NotificationTabState createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  AppState modele = AppState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            //children: modele.getProducts();
            )
        // body: _zando_home(),
        );
  }

  // Retourne les données de la base des données via une page php
  Future<List> getData() async {
    var response; // = await http.get("http://192.168.43.30:80/zando_art_web/get_data.php");
    // final response = await http.get("http://localhost/getData.php");
    return json.decode(response.body);
  }

  FutureBuilder<List> _zando_home() => FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(list: snapshot.data!)
              : Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.brown,
                ),);
        },
      );
}

class ItemList extends StatelessWidget {
  final List? list;
  const ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(list![i]['firstname']),
          leading: Icon(Icons.widgets),
          subtitle: Text("Email : ${list![i]["email"]}"),
        );
      },
    );
  }
}
