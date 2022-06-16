import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favouriates_screen.dart';

class TabsScreen extends StatefulWidget{
  @override
  State<TabsScreen> createState() {
    return TabScreenState();
  }
}
class TabScreenState extends State<TabsScreen>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Meals"
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favouriates",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavouriatesScreen()
          ],
        ),
      ),
    );
  }
}