import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '/src/constants/color.dart';
import '/src/models/user.dart';
import '/src/views/tabs/posts_tab.dart' as posts;
import '/src/views/tabs/sales_tab.dart' as sales;

class ProfileScreen extends StatefulWidget {
  final User? user;

  ProfileScreen({this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _buildTabs();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl =
        'http://192.168.43.30:80/zando_art_web/uploads/profile/user.jpeg';

    return Stack(
      children: <Widget>[
        Container(
          color: ZandoBGColor,
        ),
        Image.network(
          imgUrl,
          fit: BoxFit.fill,
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 6.0,
            sigmaY: 6.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: ZandoSecondaryColor.withOpacity(0.9),
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Profile"),
            centerTitle: false,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: _height / 12),
                CircleAvatar(
                  radius: _width < _height ? _width / 4 : _height / 4,
                  backgroundImage: NetworkImage(imgUrl),
                ),
                SizedBox(height: _height / 25.0),
                Text(
                  'publicUser.firstname publicUser.lastname',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _width / 15,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: _height / 30,
                    left: _width / 8,
                    right: _width / 8,
                  ),
                  child: Text(
                    'publicUser.email ',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: _width / 25,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  height: _height / 30,
                  color: Colors.white,
                ),
                Row(
                  children: <Widget>[
                    rowCell(4, 'Posts'),
                    rowCell(20, 'Vues'),
                  ],
                ),
                Divider(height: _height / 30, color: Colors.white),
                Padding(
                  padding: EdgeInsets.only(left: _width / 8, right: _width / 8),
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.person),
                          SizedBox(width: _width / 30),
                          const Text('SUIVRE')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget rowCell(int count, String type) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            '$count',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            type,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  TabBarView _buildTabs() {
    return TabBarView(
      controller: _controller,
      children: <Widget>[
        posts.PostsTab(),
        sales.SalesTab(),
      ],
    );
  }

  // Future<List> _getArtiste() async {
  //   var response; // = await http.get("http://192.168.43.30:80/zando_art_web/get_artiste.php");
  //   return json.decode(response.body);
  // }

  // Future<List> _isArtist() async {
  //   var response; // = await http.get("http://192.168.43.30:80/zando_art_web/artist_exit.php");
  //   return json.decode(response.body);
  // }

  // FutureBuilder<List> _buildProfile() => FutureBuilder(
  //       future: _getArtiste(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasError) print(snapshot.error);
  //         return snapshot.hasData
  //             ? Artiste(list: snapshot.data!)
  //             : Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: <Widget>[
  //                   Text(
  //                     "publicUser.firstname publicUser.lastname",
  //                     style: TextStyle(
  //                       fontSize: 40.0,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                   Text(
  //                     "Ville : publicUser.city",
  //                     style: TextStyle(
  //                         fontSize: 23.0,
  //                         fontWeight: FontWeight.normal,
  //                         color: Colors.white),
  //                   ),
  //                   Text(
  //                     "publicUser.about",
  //                     style: TextStyle(
  //                       fontSize: 20.0,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               );
  //       },
  //     );

  // FutureBuilder<List> _buildFloatingActionButton() => FutureBuilder(
  //       future: _isArtist(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) print(snapshot.error);
  //         return snapshot.hasData
  //             ? FloatingActionButton(
  //                 child: Icon(Icons.edit),
  //                 mini: true,
  //                 backgroundColor: ZandoMainColor,
  //                 elevation: 10.0,
  //                 onPressed: () {
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (context) => EditProfileScreen(),
  //                     ),
  //                   );
  //                 },
  //               )
  //             : FloatingActionButton(
  //                 child: Icon(Icons.edit),
  //                 mini: true,
  //                 backgroundColor: ZandoMainColor,
  //                 elevation: 10.0,
  //                 onPressed: () {
  //                   Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (context) => EditArtisteProfileScreen(),
  //                       )
  //                       );
  //                 },
  //               );
  //       },
  //     );
}

class Artiste extends StatelessWidget {
  final List? list;
  const Artiste({this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${list![0]['shop_name']}",
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          "${list![0]['category']}",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          "${list![0]['full_address']}",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        Text(
          "${list![0]['description']}",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
