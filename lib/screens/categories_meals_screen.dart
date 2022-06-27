import 'package:flutter/material.dart';
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
  Map<String, bool>? filters = null;
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
        if(filters!["isGlutenFree"] == false && filters!["isLactoseFree"] == false && filters!["isVeganFree"] == false && filters!["isVegetrationFree"] == false){
          return
            MealItem(title: categoryMeals[index].title, iMageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              coMplexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              id: categoryMeals[index].id,
              reMoveIteM: reMoveMeal,
            );
        }
        else{
          MealItem? mealItem = null;
          if(categoryMeals[index].isGlutenFree){
            mealItem = MealItem(title: categoryMeals[index].title, iMageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              coMplexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              id: categoryMeals[index].id,
              reMoveIteM: reMoveMeal,
            );
          }
         if(categoryMeals[index].isLactoseFree){
           if(mealItem == null) {
             mealItem = MealItem(title: categoryMeals[index].title,
               iMageUrl: categoryMeals[index].imageUrl,
               duration: categoryMeals[index].duration,
               coMplexity: categoryMeals[index].complexity,
               affordability: categoryMeals[index].affordability,
               id: categoryMeals[index].id,
               reMoveIteM: reMoveMeal,
             );
           }
         }
          if(categoryMeals[index].isVegetarian){
            if(mealItem == null) {
              mealItem = MealItem(title: categoryMeals[index].title,
                iMageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                coMplexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability,
                id: categoryMeals[index].id,
                reMoveIteM: reMoveMeal,
              );
            }
          }
          if(categoryMeals[index].isVegan){
            if(mealItem == null) {
              mealItem = MealItem(title: categoryMeals[index].title,
                iMageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                coMplexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability,
                id: categoryMeals[index].id,
                reMoveIteM: reMoveMeal,
              );
            }
          }
          return mealItem!;
        }
      },
        itemCount: categoryMeals.length,),
    );
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies() called");
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    title = routeArgs["title"]!;
    id = routeArgs["id"]!;
    categoryMeals = DUMMY_MEALS.where((Meal){
      return Meal.categories.contains(id);
    }).toList();
    if(routeArgs["filters"] != null) {
      filters = routeArgs["filters"] as Map<String, bool>;
    }
  }
}