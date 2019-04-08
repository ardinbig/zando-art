import 'package:flutter/material.dart';
import 'package:zando_art/src/models/user.dart';

User publicUser = User();


String publicEmail;
String publicFirstname;
String publicLastname;
String publicCity;
String publicAbout;
String publicAvatar;

int publicId;

String publicArtisteEmail;
String publicShopName;
String publicDescription;
String publicPhone;
String publicCategory;
String publicAddress;

final List<String> variables = [

];

class ItemList extends StatelessWidget {

  final List list;
  const ItemList({this.list});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.all(6.0),
          child: Card(
            child: ListTile(
              title: Text(list[i]['firstname']),
              leading: Icon(Icons.widgets),
              subtitle: Text("Email : ${list[i]["email"]}"),
            ),
          ),
        );
      },
    );
  }
}