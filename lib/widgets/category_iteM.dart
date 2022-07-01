import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../screens/categories_meals_screen.dart';

class CategoryIteM extends StatelessWidget{
  final String title;
  final Color color;
  final String id;
  CategoryIteM({required this.title, required this.color, required this.id});
  @override
  void selectIteM(BuildContext context){
    Navigator.of(context).pushNamed(CategoriesMeals.routeNaMe, arguments: {
      "title" : title,
      "id" : id,
    });
  }
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selectIteM(context);
      },
        child: Container(
      child: Text(
        title,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.7),
            color
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft
        ),
        borderRadius: BorderRadius.circular(15)
      ),
    )
    );
  }
}