import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/meals_detail_screen.dart';
import 'package:flutter_meals_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';

import 'screens/categories_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
       primarySwatch:Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            ),
      ),
      home: TabsScreen(),
         // This trailing comma makes auto-formatting nicer for build methods.

      routes: {
        CategoriesMeals.routeNaMe : (context){
        return CategoriesMeals();
      },
        MealDetail.routeNaMe : (context){
          return MealDetail();
        }
    },
      onGenerateRoute: (settings){
        print(settings.name);
        return MaterialPageRoute(builder: (context){
          return CategoriesScreen();
        });
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(
          builder: (context){
            return CategoriesScreen();
          }
        );
      },
    );
  }
}

