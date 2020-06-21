import 'package:flutter/material.dart';
import 'package:meal_app/widget/filter.dart';
class MealDrawer extends StatelessWidget {

  Widget buildListTile(IconData iconData, String title, Function function){
    return  ListTile(
      leading: Icon(iconData,size: 26,),
      title: Text(title,style: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),),
      onTap: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          color: Theme.of(context).accentColor,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text('Cooking Up', style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 26
          ),),
        ),
        SizedBox(
          height: 20,
        ),

        buildListTile(Icons.restaurant, 'Meals',(){
         // Navigator.of(context).pushNamed('/');
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile(Icons.settings, 'Filters',(){
         // Navigator.of(context).pushNamed(MealFilter.MealFilter_ROUTE);
          Navigator.of(context).pushReplacementNamed(MealFilter.MealFilter_ROUTE);
        }),
      ],),
    );
  }

}
