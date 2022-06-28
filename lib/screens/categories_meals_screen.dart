
import 'package:flutter/material.dart';
import 'package:flutter_meals_app/dummy_data.dart';
import 'package:flutter_meals_app/models/meals.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoriesMeals extends StatefulWidget{
  static String routeNaMe = "/category-Meals";
  @override
  State<CategoriesMeals> createState() {
    return CategoriesScreenState();
  }

}
class CategoriesScreenState extends State<CategoriesMeals>{
  late String title;
  late String id;
  late List<Meal> categoryMeals;
  late Map<String, bool> filters;
  /*@override
  void initState() {
    super.initState();
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    title = routeArgs["title"]!;
    id = routeArgs["id"]!;
    categoryMeals = DUMMY_MEALS.where((Meal){
      return Meal.categories.contains(id);
    }).toList() as List<Meal>;
  }*/
  void reMoveMeal(String MealId){
    setState(() {
      categoryMeals.removeWhere((element){
        return element.id == MealId;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(itemBuilder: (context, index){
          return
            MealItem(title: categoryMeals[index].title, iMageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              coMplexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              id: categoryMeals[index].id,
              reMoveIteM: reMoveMeal,
            );
      },
        itemCount: categoryMeals.length,),
    );
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    categoryMeals = [];
    print("didChangeDependencies() called");
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    title = routeArgs["title"]! as String;
    id = routeArgs["id"]! as String;
    filters = routeArgs["filters"] as Map<String, bool>;
    if((filters["isGlutenFree"] == false && filters["isLactoseFree"] == false && filters["isVeganFree"] == false && filters["isVegetrationFree"] == false) && categoryMeals.length == 0) {
      categoryMeals = DUMMY_MEALS.where((Meal) {
        return Meal.categories.contains(id);
      }).toList();
    }
    else {
      if (categoryMeals.length > 0) {
        categoryMeals = categoryMeals.where((iteM) {
          bool result = false;
          if (iteM.isLactoseFree && filters["isLactoseFree"]!) {
            result = true;
          }
          if (iteM.isGlutenFree && filters["isGlutenFree"]!) {
            result = true;
          }
          if (iteM.isVegan && filters["isVeganFree"]!) {
            result = true;
          }
          if (iteM.isVegetarian && filters["isVegetrationFree"]!) {
            result = true;
          }
          return result;
        }).toList();
      }
      else if(categoryMeals.length == 0){
        categoryMeals = DUMMY_MEALS.where((Meal) {
          return Meal.categories.contains(id);
        }).toList();
        categoryMeals = categoryMeals.where((iteM){
          bool result = false;
          if (iteM.isLactoseFree && filters["isLactoseFree"]!) {
            result = true;
          }
          if (iteM.isGlutenFree && filters["isGlutenFree"]!) {
            result = true;
          }
          if (iteM.isVegan && filters["isVeganFree"]!) {
            result = true;
          }
          if (iteM.isVegetarian && filters["isVegetrationFree"]!) {
            result = true;
          }
          return result;
        }).toList();
      }
    }
  }
}