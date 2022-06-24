import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget implements DrawerCallBack{
  Map<String, bool> _filters = {
    "isGlutenFree" : false,
    "isLactoseFree" : false,
    "isVeganFree" : false,
    "isVegetrationFree" : false
  };

  set filters(Map<String, bool> filters){
    _filters = filters;
  }
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
              Navigator.of(context).pushReplacementNamed("/", arguments: _filters);
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

  @override
  void recieveFilter(Map<String, bool> filt) {
    print("filt is ");
    print(filt);
    _filters = filt;
  }
  @override
  Map<String, bool>? getFilters() {
    return _filters;
  }

}
class DrawerCallBack{
  void recieveFilter(Map<String, bool> filters){}
  Map<String, bool>? getFilters(){}
}