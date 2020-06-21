import 'package:flutter/material.dart';
import 'package:meal_app/widget/category_screen.dart';
import 'package:meal_app/widget/favourite.dart';
import 'package:meal_app/widget/meal_drawer.dart';

class TabBarBottom extends StatefulWidget {
  @override
  _TabBarBottomState createState() => _TabBarBottomState();
}

class _TabBarBottomState extends State<TabBarBottom> {
  List<Map<String, Object>> widgetList = [
    {'page': CategoryScreen(), 'title': 'Category'},
    {'page': FavouriteScreen(), 'title': 'Favourite'},
  ];
  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetList[_selectedPageIndex]['title']),
      ),

      drawer: MealDrawer(),
      body: widgetList[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            title: Text('Favourite'),
          ),
        ],
      ),
    );
  }
}
