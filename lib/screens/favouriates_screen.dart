
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

import '../models/DataHolder.dart';
class FavouriatesScreen extends StatelessWidget{
  late List<Meal> categoriesMeal;
  FavouriatesScreen(){
    categoriesMeal = [];
    List<String> MealsIds = DataHolder.getInstance().getMeals;
    categoriesMeal = DUMMY_MEALS.where((iteM){
      return MealsIds.contains(iteM.id);
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
        return MealItem(title: categoriesMeal[index].title,
          iMageUrl: categoriesMeal[index].imageUrl,
        duration: categoriesMeal[index].duration,
          coMplexity: categoriesMeal[index].complexity,
          affordability: categoriesMeal[index].affordability,
          id: categoriesMeal[index].id,
          isFavouriate: false,
        );
      },
        itemCount: categoriesMeal.length,
    );
  }
}