
import 'package:flutter/material.dart';
import 'package:flutter_meals_app/dummy_data.dart';
import '../models/meals.dart';
import '../dummy_data.dart';
import '../models/DataHolder.dart';
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
              isFavouriate: true,
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
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    title = routeArgs["title"]!;
    id = routeArgs["id"]!;
    print("didChangeDependencies() called");
    Map<String, bool> filters = DataHolder.getInstance().getFilters;
    categoryMeals = DUMMY_MEALS.where((Meal) {
      return Meal.categories.contains(id);
    }).toList();
    if((filters[DataHolder.isGlutenFreeKey] == false && filters[DataHolder.isLactoseFree] == false && filters[DataHolder.isVeganFree] == false && filters[DataHolder.isVegetrationFree] == false)) {
      return;
    }
    else {
        categoryMeals = categoryMeals.where((iteM) {
          bool result = false;
          if (iteM.isLactoseFree && filters[DataHolder.isLactoseFree]!) {
            result = true;
          }
          if (iteM.isGlutenFree && filters[DataHolder.isGlutenFreeKey]!) {
            result = true;
          }
          if (iteM.isVegan && filters[DataHolder.isVeganFree]!) {
            result = true;
          }
          if (iteM.isVegetarian && filters[DataHolder.isVegetrationFree]!) {
            result = true;
          }
          return result;
        }).toList();
    }
  }
}