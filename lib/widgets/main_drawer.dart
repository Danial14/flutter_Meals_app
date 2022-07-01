import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text("Cooking up!",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
              fontSize: 30
            ),
            ),
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.restaurant, size: 26,),
            title: Text("Meal",
            style: TextStyle(
              fontFamily: "RobotoCondensed",
              fontSize: 24,
              fontWeight: FontWeight.w700
            ),
            ),
            onTap: (){
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26
            ),
            title: Text(
              "Filter",
              style: TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 24,
                fontWeight: FontWeight.w700
              ),
            ),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(FilterScreen.routeNaMe);
            },
          )
        ],
      )
    );
  }

}