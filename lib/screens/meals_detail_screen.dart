import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_meals_app/dummy_data.dart';
import 'package:flutter_meals_app/models/DataHolder.dart';

class MealDetail extends StatelessWidget{
  static String routeNaMe = "/Meals_details";
  late String _title;
  late String _id;
  late final _isFavouriate;

  @override
  Widget build(BuildContext context) {
    Map<String, Object> arguMents = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    _title = arguMents["title"]! as String;
    _id = arguMents["id"]! as String;
    _isFavouriate = arguMents["isFavouriate"]! as bool;
    final selectedMeal = DUMMY_MEALS.firstWhere((Meal){
      return Meal.id == _id;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${selectedMeal.title}"
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
        height: 300,
        width: double.infinity,
        child: Image.network(selectedMeal.imageUrl,
        fit: BoxFit.cover,
        ),

      ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10
            ),
            child: Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15)
            ),
            padding: EdgeInsets.all(10),
            height: 160,
            width: 300,
            child: ListView.builder(
              itemBuilder: (context, index){
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(selectedMeal.ingredients[index]),
                  )
                );
              },
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10
            ),
            child: Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            width: 300,
            height: 160,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey)
            ),
            child: ListView.builder(itemBuilder: (context, index){
              return Column(
                  children: <Widget>[
                    ListTile(
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(
                  selectedMeal.steps[index]
                ),
              ),
                    const Divider()
              ]
              );
            },
            itemCount: selectedMeal.steps.length,
            ),
          )
      ]
    ),
      floatingActionButton: this._isFavouriate ? FloatingActionButton(
        child: Icon(
        Icons.favorite
    ),
    onPressed: (){
          DataHolder.getInstance().setFavouriate(_id);
    }
    ,
    ) : null,
    );
  }
}