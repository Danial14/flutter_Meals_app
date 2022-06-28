import 'package:flutter/material.dart';
import 'package:flutter_meals_app/dummy_data.dart';
import '../widgets/category_iteM.dart';

class CategoriesScreen extends StatelessWidget{
  final Map<String, bool> filters;
  CategoriesScreen({required this.filters});
  @override
  Widget build(BuildContext context) {
    return
    GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 3 / 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
    ),
    children: DUMMY_CATEGORIES.map((category){
      return CategoryIteM(title: category.title, color: category.color, id: category.id, filters: filters,);
    }).toList(),
    );
  }
}