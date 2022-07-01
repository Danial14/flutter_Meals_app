import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'package:flutter_meals_app/screens/favouriates_screen.dart';
import 'package:flutter_meals_app/widgets/main_drawer.dart';




class TabsScreen extends StatefulWidget{
  static final MainDrawer drawer = MainDrawer();
  @override
  State<TabsScreen> createState() {
    return TabScreenState();
  }
}
class TabScreenState extends State<TabsScreen>{
  int _selectedIndex = 0;
  void _selectIndex(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pages = [
      {"page" : CategoriesScreen(), "title" : "Categories"},
      {"page" : FavouriatesScreen(), "title" : "Favouriates"}
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            pages[_selectedIndex]["title"]
          ),
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: pages[_selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favouriates"
          )
        ],
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
      ),
      );
  }
}