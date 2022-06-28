import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget{
  static const routeNaMe = "/filters";
  late DrawerCallBack drawer;
  FilterScreen({required this.drawer});
  @override
  State<FilterScreen> createState() {
    return FilterScreenState();
  }
}
class FilterScreenState extends State<FilterScreen>{
  bool _glutenFree = false;
  bool _lactose = false;
  bool _veganFree = false;
  bool _vegetrian = false;
  bool currentValue = false;
  Widget switchTileBuilder(String title, bool val, String subTitle, Function callBack){
    return SwitchListTile(
      title : Text(title),
      value: val,
      subtitle: Text(subTitle),
      onChanged: (newValue){
        callBack(newValue);
      },
    );
  }
  Future<void> _initFilters() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    List keys = sharedPreferences.getKeys().toList();
    if(keys.isNotEmpty){
      print("keys not eMpty");
      print(keys[0]);
      keys.map((key){
        print(key);
        switch(key){
          case "isGlutenFree" :
            _glutenFree = sharedPreferences.getBool(key)!;
            print("get gluten " + _glutenFree.toString());
            break;
          case "isLactoseFree" :
            _lactose = sharedPreferences.getBool(key)!;
            break;
          case "isVeganFree" :
            _veganFree = sharedPreferences.getBool(key)!;
            break;
          case "isVegetrationFree" :
            _vegetrian = sharedPreferences.getBool(key)!;
            break;
        }
      }).toList();
    }
  }
  @override
  initState(){
    // TODO: implement initState
    super.initState();
    _initFilters().whenComplete((){

    });
  }
  @override
  Widget build(BuildContext context) {
    Map<String, bool> filters = {
      "isGlutenFree" : false,
      "isLactoseFree" : false,
      "isVeganFree" : false,
      "isVegetrationFree" : false
    };
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 15),
          child: IconButton(
          icon: Icon(Icons.save),
            onPressed: () async {
            final sharedPreferences = await SharedPreferences.getInstance();
            if(_glutenFree){
              sharedPreferences.setBool("isGlutenFree", _glutenFree);
              sharedPreferences.commit();
              print("share pref gluten " + _glutenFree.toString());
            }
            if(_lactose){
              sharedPreferences.setBool("isLactoseFree", _lactose);
            }
            if(_vegetrian){
              sharedPreferences.setBool("isVeganFree", _vegetrian);
            }
            if(_veganFree){
              sharedPreferences.setBool("isVeganFree", _veganFree);
            }
            },

        )
          )],
      ),
      body: Column(
        children: <Widget>[
          Text(
            "",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                switchTileBuilder("Gluten free", _glutenFree, "Only include gluten-free", (newValue){
                 Map<String, bool>? filters = widget.drawer.getFilters();
                  if(newValue){
                    setState(() {
                      filters!["isGlutenFree"] = newValue;
                      widget.drawer.recieveFilter(filters);
                      _glutenFree = newValue;
                    });
                  }
                  else{
                    setState(() {
                      filters!["isGlutenFree"] = newValue;
                      widget.drawer.recieveFilter(filters);
                      _glutenFree = newValue;
                    });
                  }
                }),
                switchTileBuilder("Lactose free", _lactose, "Only lactose free", (newValue){
                  Map<String, bool>? filters = widget.drawer.getFilters();
                  if(newValue){
                    setState(() {
                      filters!["isLactoseFree"] = newValue;
                      widget.drawer.recieveFilter(filters);
                      _lactose = newValue;
                    });
                  }
                  else{
                    setState(() {
                      filters!["isLactoseFree"] = newValue;
                      widget.drawer.recieveFilter(filters);
                      _lactose = newValue;
                    });
                  }
                }),
                switchTileBuilder("Vegen free", _veganFree, "Only vegen free", (newValue){
                  Map<String, bool>? filters = widget.drawer.getFilters();
                  if(newValue){
                    setState(() {
                      filters!["isVeganFree"] = newValue;
                      widget.drawer.recieveFilter(filters);
                      _veganFree = newValue;
                    });
                  }
                  else{
                    setState(() {
                      filters!["isVeganFree"] = newValue;
                      widget.drawer.recieveFilter(filters);
                      _veganFree = newValue;
                    });
                  }
                }),
                switchTileBuilder("Vegetrian free", _vegetrian, "Only vegration free", (newValue){
                  Map<String, bool>? filters = widget.drawer.getFilters();
                  if(_vegetrian){
                    setState(() {
                      filters!["isVegetrationFree"] = newValue;
                      widget.drawer.recieveFilter(filters);
                      _vegetrian = newValue;
                    });
                  }
                  else{
                    setState(() {
                      filters!["isVegetrationFree"] = newValue;
                      widget.drawer.recieveFilter(filters);
                      _vegetrian = newValue;
                    });
                  }
                })
              ],
            ),
          )
        ],
      ),
      drawer: widget.drawer as MainDrawer,
    );
  }
}