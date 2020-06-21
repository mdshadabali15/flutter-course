import 'dart:collection';

import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../resource/dummy_data.dart';
import 'meal_item.dart';


class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meal';

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  List<Meal> _mealList;


  String title;
  String id;

  var isListChanged = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!isListChanged) {
      final arguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = arguments['title'];
      id = arguments['id'];

      _mealList = DUMMY_MEALS
          .where((element) => element.categories.contains(id))
          .toList();
    }
    isListChanged = true;
    super.didChangeDependencies();
  }

  void removeItem(String id){
    print(' Delete method Id : '+id);
    setState(() {
      _mealList.removeWhere((element) => element.id==id);
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              title: _mealList[index].title,
              id: _mealList[index].id,
              imageUrl: _mealList[index].imageUrl,
              complexity: _mealList[index].complexity,
              affordability: _mealList[index].affordability,
              duration: _mealList[index].duration,
              function: removeItem,
            );
          },
          itemCount: _mealList.length,
        ));
  }
}
