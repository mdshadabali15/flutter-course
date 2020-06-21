import 'package:flutter/material.dart';
import 'package:meal_app/resource/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const mealDetail_route = '/meal_detail';

  @override
  Widget build(BuildContext context) {
    final variable =
    ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, String>;
    final id = variable['id'];
    final title = variable['title'];

    final mealDetail = DUMMY_MEALS.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealDetail.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Ingredients',
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(mealDetail.ingredients[index])),
                    color: Theme
                        .of(context)
                        .accentColor,
                  );
                },
                itemCount: mealDetail.ingredients.length,
              ),
            ),


            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Steps',
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
              ),
            ),

            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 150,
                width: 300,
                child: ListView.builder(itemBuilder: (ctx, index) => Column(children: <Widget>[

                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index+1}'),
                    ),
                    title: Text(mealDetail.steps[index]),

                  ),
                  Divider(thickness: 3.0,),

                ],),
                  itemCount: mealDetail.steps.length

                )

            ),


            FloatingActionButton(
              child: Icon(Icons.delete),
              onPressed: (){
                Navigator.of(context).pop(id);
              },
            ),

          ],
        ),
      ),
    );
  }
}
