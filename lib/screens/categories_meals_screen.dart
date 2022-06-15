import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoriesMeals extends StatelessWidget{
  late String title;
  late String id;
  static String routeNaMe = "/category-Meals";
  //CategoriesMeals({required this.title, required this.id});
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    title = routeArgs["title"]!;
    id = routeArgs["id"]!;
    final categoryMeals = DUMMY_MEALS.where((Meal){
      return Meal.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return MealItem(title: categoryMeals[index].title, iMageUrl: categoryMeals[index].imageUrl,
          duration: categoryMeals[index].duration,
        coMplexity: categoryMeals[index].complexity,
          affordability: categoryMeals[index].affordability,
        );
      },
      itemCount: categoryMeals.length,),
    );
  }
}