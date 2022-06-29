
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
  late Map<String, bool> _filters;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    print("categories sccreen");
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    title = routeArgs["title"]! as String;
    id = routeArgs["id"]! as String;
    _filters = routeArgs["filters"] as Map<String, bool>;
    categoryMeals = categoryMeals = DUMMY_MEALS.where((Meal) {
      return Meal.categories.contains(id);
    }).toList();
    //categoryMeals = [];
    print("didChangeDependencies() called");
    if((_filters["isGlutenFree"] == false && _filters["isLactoseFree"] == false && _filters["isVeganFree"] == false && _filters["isVegetrationFree"] == false)) {
      categoryMeals = DUMMY_MEALS.where((Meal) {
        return Meal.categories.contains(id);
      }).toList();
    }
    else {
        categoryMeals = categoryMeals.where((iteM) {
          bool result = false;
          if (iteM.isLactoseFree && _filters["isLactoseFree"]!) {
            result = true;
          }
          if (iteM.isGlutenFree && _filters["isGlutenFree"]!) {
            result = true;
          }
          if (iteM.isVegan && _filters["isVeganFree"]!) {
            result = true;
          }
          if (iteM.isVegetarian && _filters["isVegetrationFree"]!) {
            result = true;
          }
          return result;
        }).toList();
    }
  }
}