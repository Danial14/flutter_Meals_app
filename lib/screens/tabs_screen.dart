import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/categories_screen.dart';
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
  Map<String, bool>? filters = null;
  void _selectIndex(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  set setFilters(Map<String, bool> filters){
    this.filters = filters;
  }
  @override
  Widget build(BuildContext context) {
    Object? filters = ModalRoute.of(context)?.settings.arguments;
    if(filters != null){
      setFilters = filters as Map<String, bool>;
    }
    print(filters);
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