import 'dart:ui';

import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../screens/meals_detail_screen.dart';

class MealItem extends StatelessWidget{
  final String id;
  final String title;
  final String iMageUrl;
  final int duration;
  final Complexity coMplexity;
  final Affordability affordability;
  MealItem({required this.title, required this.iMageUrl, required this.duration,
    required this.coMplexity,
    required this.affordability,
  required this.id
  });

  void selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(MealDetail.routeNaMe, arguments: {"title" : title, "id" : id});
  }
  String get coMplexityText{
    switch(coMplexity){
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      default:
        return "Hard";
    }
  }
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";
      default:
        return "Pricey";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          selectMeal(context);
        },
        borderRadius: BorderRadius.circular(15),
        child: Card(shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)
                  ),
                  child: Image.network(iMageUrl, height: 250, width: double.infinity, fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                       horizontal: 20
                    ),
                    color: Colors.black54,
                    child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  )
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                  children: <Widget>[
                    Icon(Icons.schedule),
                  SizedBox(width: 20,),
                  Text("$duration Min", style: const TextStyle(
                    fontSize: 25
                  ),
                  )
                  ]
                  ),
                  Row(
                  children: <Widget>[
                    Icon(Icons.work),
                  Text(coMplexityText)
                  ]),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      Text(affordabilityText)
                    ],
                  )
                ],
              ),
            ),
          ],
        )
        ),
      ),
    );
  }
}