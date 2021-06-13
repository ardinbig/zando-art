import 'package:flutter/material.dart';

class PostsTab extends StatefulWidget {
  @override
  _PostsTabState createState() => _PostsTabState();
}

class _PostsTabState extends State<PostsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.shopping_basket),
      ),
    );
  }
}
