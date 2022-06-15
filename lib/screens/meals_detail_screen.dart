import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget{
  static String routeNaMe = "/Meals_details";
  late String _title;
  @override
  Widget build(BuildContext context) {
    Map<String, String> args = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    _title = args["MealTitle"]!;
    return Center(
      child: Text(_title),
    );
  }
}