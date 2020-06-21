import 'package:flutter/material.dart';
import 'package:meal_app/widget/category_screen.dart';
import 'package:meal_app/widget/favourite.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'favourite',
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          CategoryScreen(),
          FavouriteScreen(),
        ],),
      ),
    );
  }
}
