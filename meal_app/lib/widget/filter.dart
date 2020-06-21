import 'package:flutter/material.dart';
import 'package:meal_app/widget/meal_drawer.dart';

class MealFilter extends StatefulWidget {
  static const MealFilter_ROUTE = '/mealFilter';
  @override
  _MealFilterState createState() => _MealFilterState();
}

class _MealFilterState extends State<MealFilter> {
   var isGlutenFree = false;

    var  isVegan = false;

   var isVegetarian = false;

   var isLactoseFree = false;

  Widget switchListTileWidget(String title, String subtitle,bool currentValue, Function function) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 18),
      ),
      value: currentValue,
      onChanged: function,

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MealDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        //margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Expanded( // Expanded is used when you allow widget to take as much space available
              child: ListView( // ListView builder is not being used as list size is fixed.
                children: <Widget>[
                  switchListTileWidget(
                      'Gluten Free', 'Filter Gluten Free Meal',isGlutenFree,(newValue){
                        setState(() {
                          isGlutenFree = newValue;
                        });
                  }),
                  switchListTileWidget('Vegan', ' Filter Vegan Meal',isVegan, (newValue){
                    setState(() {
                      isVegan = newValue;
                    });
                  }),
                  switchListTileWidget('Vegetarian', ' Filter Vegetarian Meal',isVegetarian,(newValue){
                    setState(() {
                      isVegetarian = newValue;
                    });
                  }),
                  switchListTileWidget(
                      'Lactose Free', 'FilterLactose Free Meal',isLactoseFree,(newValue){
                        setState(() {
                          isLactoseFree = newValue;
                        });
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
