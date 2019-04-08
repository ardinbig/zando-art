import 'package:flutter/material.dart';
import '../../src/supplementals/colors.dart';
import '../screens/tabs/dessin_tab.dart' as dessin;
import '../screens/tabs/painture_tab.dart' as painture;

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with SingleTickerProviderStateMixin {

  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
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
        title: Text('Catagorie'),
        backgroundColor: ZandoMainColor,
      ),
      body: _buildTabs(),
      bottomNavigationBar: _buildTopNavBar(),
    );
  }

  Widget _buildTopNavBar() {
    return TabBar(
      labelColor: ZandoMainColor,
      indicatorColor: ZandoSecondaryColor,
      controller: _controller,
      tabs: <Widget>[
        Tab(
          text: "Dessin",
        ),
        Tab(
          text: "Painture",
        ),
      ],
    );
  }

  TabBarView _buildTabs() => TabBarView(
    controller: _controller,
    children: <Widget>[
      dessin.DessinTab(),
      painture.PaintureTab(),
    ],
  );
}

class CategoryCard extends StatelessWidget {

  CategoryCard({this.icon, this.title, this.colorIcon});

  final IconData icon;
  final String title;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Center(
        child: Card(
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                color: colorIcon,
                size: 50.0,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

