import 'package:flutter/material.dart';
import 'package:meal_app/statefullwidget/tab_bar.dart';
import 'package:meal_app/statefullwidget/tab_bar_bottom.dart';
import 'package:meal_app/widget/category_meal_screen.dart';
import 'package:meal_app/widget/category_screen.dart';
import 'package:meal_app/widget/filter.dart';
import 'package:meal_app/widget/meal_detail.dart';

void main() => runApp(MealApp());

class MealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 20,fontWeight: FontWeight.bold),
            ),
      ),
      //home: TabBarScreen(), // this will use for upper bottom
      //home: TabBarBottom(),
      initialRoute: '/',
      routes:{ // routes will be configured here
        '/': (context)=> TabBarBottom(),
        CategoryMealScreen.routeName: (context)=> CategoryMealScreen(),
        MealDetail.mealDetail_route: (ctx)=> MealDetail(),
        MealFilter.MealFilter_ROUTE: (ctx)=> MealFilter(),
      } ,
    );
  }
}
