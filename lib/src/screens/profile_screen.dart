import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import "dart:math";
import 'package:image/image.dart' as Img;
import 'package:zando_art/src/models/user.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:zando_art/src/app/public.dart';
import '../supplementals/colors.dart';
import '../../src/screens/edit_profile_screen.dart';
import '../../src/screens/upgrade_screen.dart';
import '../../src/screens/edit_artiste_profile_screen.dart';
import '../../src/screens/tabs/sales_tab.dart' as sales;
import '../../src/screens/tabs/posts_tab.dart' as posts;

class ProfileScreen extends StatefulWidget {

  final User user;

  ProfileScreen({this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {

  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _buildTabs();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: ZandoMainColor,
      ),
      body: ListView(
        children: <Widget>[
          _buildProfileHeader(),
          _buildTopNavBar(_controller),
        ],
      ),
    );
  }

  Widget _buildTopNavBar(TabController controller) {
    return TabBar(
      labelColor: ZandoMainColor,
      indicatorColor: ZandoSecondaryColor,
      controller: controller,
      tabs: <Widget>[
        Tab(
          text: "Postes",
        ),
        Tab(
          text: "Ventes",
        ),
      ],
    );
  }

  /*
  Future getImageGallery() async {
    var imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery
    );

    final tmpDir = await getTemporaryDirectory();
    final path = tmpDir.path;

    int rand = Random().nextInt(1000000000);

    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image thumb = Img.copyResize(image, 500);

    var compressImg = File("$path/img_$rand.jpg").writeAsStringSync(thumb);
   // ..writeAsStringSync(Img.encodeJpg(thumb, quality: 85));

    var compressImg = File("$path/img_$rand.jpg").writeAsStringSync(Img.encodeJpg(thumb, quality: 85, ));

    setState(() {
      publicAvatar = compressImg;
    });

    if( imageFile == null) {
      CircularProgressIndicator();
    } else {
      upload(imageFile);
    }
  }

  Future getImageCamera() async {
    var imageFile = await ImagePicker.pickImage(
        source: ImageSource.camera
    );

    final tmpDir = await getTemporaryDirectory();
    final path = tmpDir.path;

    int rand = Random().nextInt(1000000000);

    img.Image image = img.decodeImage(imageFile.readAsBytesSync());
    img.Image thumb = img.copyResize(image, 500);

    var compressImg = File("$path/img_$rand.jpg")
      ..writeAsStringSync(img.encodeJpg(thumb, quality: 85));

    setState(() {
      publicAvatar = compressImg;
    });

    if( imageFile == null) {
      CircularProgressIndicator();
    } else {
      upload(imageFile);
    }
  }

  */

  Future upload(File imageFile) async {
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://192.168.43.30:80/zando_art_web/artist_exit.php");

    var request = http.MultipartRequest("POST", uri);

    var multipartFile = http.MultipartFile("avatar", stream, length, filename: basename(imageFile.path));

    request.files.add(multipartFile);

    var response = await request.send();

    if(response.statusCode == 200) {
      print("Image uploaded");
    } else {
      print("Upload failed");
    }

    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  Widget _buildProfileHeader() => Container(
    padding: EdgeInsets.all(14.0),
    color: ZandoMainColor,
    height: 190.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           // _buildFloatingActionButton(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user.jpeg"),
                  ),
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                        color: ZandoMainColor,
                        child: Icon(Icons.image, color: ZandoWhiteColor,),
                        //onPressed: getImageGallery,
                    ),
                    FlatButton(
                        color: ZandoMainColor,
                        child: Icon(Icons.camera_alt, color: ZandoWhiteColor,),
                        //onPressed: getImageCamera,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              child: Text("Promouvoir votre compte", style: TextStyle(color: ZandoWhiteColor, fontStyle: FontStyle.italic),),
              onPressed: () {
                //Navigator.pushReplacement(context,
                  //  MaterialPageRoute(builder: (context) => UpgradeScreen())
                //);
              },
            ),
            _buildFloatingActionButton(),
          ],
        ),
      ],
    ),
  );

  Stack _buildStack() => Stack(
    children: <Widget>[
      Container(
        height: 250.0,
        color: ZandoMainColor,

        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Hero(
                        tag: "profile_picture",
                        child: Image.asset(
                          "assets/images/user.jpeg",
                          alignment: Alignment.topLeft,
                          height: 120.0,
                        ),
                      ),
                      Expanded(
                        // child: _buildProfile(),
                      ),
                    ],
                  ),
                  //_buildTabs(),

                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );

  TabBarView _buildTabs() => TabBarView(
    controller: _controller,
    children: <Widget>[
      posts.PostsTab(),
      sales.SalesTab(),
    ],
  );

  Future<List> _getArtiste() async {
    final response = await http.get("http://192.168.43.30:80/zando_art_web/get_artiste.php");
    return json.decode(response.body);
  }

  Future<List> _isArtist() async {
    final response = await http.get("http://192.168.43.30:80/zando_art_web/artist_exit.php");
    return json.decode(response.body);
  }


  FutureBuilder<List> _buildProfile() => FutureBuilder(
    future: _getArtiste(),
    builder: (context, snapshot) {
      if(snapshot.hasError) print(snapshot.error);
      return snapshot.hasData ? Artiste(list: snapshot.data)
      : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("${publicUser.firstname} ${publicUser.lastname}", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),),
          Text("Ville : ${publicUser.city}" , style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.normal, color: Colors.white)),
          Text("${publicUser.about}", style: TextStyle(fontSize: 20.0, color: Colors.white), ),
        ],
      );
    },
  );

  FutureBuilder<List> _buildFloatingActionButton() => FutureBuilder(
    future: _isArtist(),
    builder: (context, snapshot) {
      if(snapshot.hasData) print(snapshot.error);
      return snapshot.hasData ? FloatingActionButton(
        child: Icon(Icons.edit),
        mini: true,
        backgroundColor: ZandoMainColor,
        elevation: 10.0,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditProfileScreen())
          );
        },
      ) : FloatingActionButton(
        child: Icon(Icons.edit),
        mini: true,
        backgroundColor: ZandoMainColor,
        elevation: 10.0,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditArtisteProfileScreen())
              /// TODO: finalise la modification du profile de l'artise.
          );
        },
      );
    },
  );
}

class Artiste extends StatelessWidget {

  final List list;
  const Artiste({this.list});


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text("${list[0]['shop_name']}", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),),
        Text("${list[0]['category']}", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white)),
        Text("${list[0]['full_address']}", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.normal, color: Colors.white)),
        Text("${list[0]['description']}", style: TextStyle(fontSize: 20.0, color: Colors.white), ),
      ],
    );
  }
}
