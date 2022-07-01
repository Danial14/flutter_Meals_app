import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/DataHolder.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget{
  static const routeNaMe = "/filters";
  @override
  State<FilterScreen> createState() {
    print("filterscreenstate");
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
      setState(() {
        for(int i = 0; i < keys.length; i++){
          switch(keys[i]){
            case DataHolder.isGlutenFreeKey :
              _glutenFree = sharedPreferences.getBool(keys[i])!;
              DataHolder.getInstance().setFiltersIteM(DataHolder.isGlutenFreeKey, _glutenFree);
              break;
            case DataHolder.isLactoseFree :
              _lactose = sharedPreferences.getBool(keys[i])!;
              DataHolder.getInstance().setFiltersIteM(DataHolder.isLactoseFree, _lactose);
              break;
            case DataHolder.isVeganFree :
              _veganFree = sharedPreferences.getBool(keys[i])!;
              DataHolder.getInstance().setFiltersIteM(DataHolder.isVeganFree, _veganFree);
              break;
            case DataHolder.isVegetrationFree :
              _vegetrian = sharedPreferences.getBool(keys[i])!;
              DataHolder.getInstance().setFiltersIteM(DataHolder.isVegetrationFree, _vegetrian);
              break;
          }
        }
      });
    }
  }
  @override
  initState(){
    // TODO: implement initState
    super.initState();
    _initFilters();
  }
  @override
  Widget build(BuildContext context) {
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
              sharedPreferences.setBool(DataHolder.isGlutenFreeKey, _glutenFree);
              print("share pref gluten " + _glutenFree.toString());
            }
            if(_lactose){
              sharedPreferences.setBool(DataHolder.isLactoseFree, _lactose);
            }
            if(_vegetrian){
              sharedPreferences.setBool(DataHolder.isVegetrationFree, _vegetrian);
            }
            if(_veganFree){
              sharedPreferences.setBool(DataHolder.isVeganFree, _veganFree);
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
                  if(newValue){
                    setState(() {
                      _glutenFree = newValue;
                      DataHolder.getInstance().setFiltersIteM(DataHolder.isGlutenFreeKey, _glutenFree);
                    });
                  }
                  else{
                    setState(() {
                      _glutenFree = newValue;
                      DataHolder.getInstance().setFiltersIteM(DataHolder.isGlutenFreeKey, _glutenFree);
                      _reMoveIteM(DataHolder.isGlutenFreeKey);
                    });
                  }
                }),
                switchTileBuilder("Lactose free", _lactose, "Only lactose free", (newValue){
                  if(newValue){
                    setState(() {
                      _lactose = newValue;
                      DataHolder.getInstance().setFiltersIteM(DataHolder.isLactoseFree, _lactose);
                    });
                  }
                  else{
                    setState(() {
                      _lactose = newValue;
                      DataHolder.getInstance().setFiltersIteM(DataHolder.isLactoseFree, _lactose);
                      _reMoveIteM(DataHolder.isLactoseFree);
                    });
                  }
                }),
                switchTileBuilder("Vegen free", _veganFree, "Only vegen free", (newValue){
                  if(newValue){
                    setState(() {
                      _veganFree = newValue;
                      DataHolder.getInstance().setFiltersIteM(DataHolder.isVeganFree, newValue);
                    });
                  }
                  else{
                    setState(() {
                      _veganFree = newValue;
                      DataHolder.getInstance().setFiltersIteM(DataHolder.isVeganFree, newValue);
                      _reMoveIteM(DataHolder.isVeganFree);
                    });
                  }
                }),
                switchTileBuilder("Vegetrian free", _vegetrian, "Only vegration free", (newValue){
                  if(newValue){
                    setState(() {
                      _vegetrian = newValue;
                      DataHolder.getInstance().setFiltersIteM(DataHolder.isVegetrationFree, newValue);
                    });
                  }
                  else{
                    setState(() {
                      _vegetrian = newValue;
                      DataHolder.getInstance().setFiltersIteM(DataHolder.isVegetrationFree, newValue);
                      _reMoveIteM(DataHolder.isVegetrationFree);
                    });
                  }
                })
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  void _reMoveIteM(String key) async{
    final sharedPref = await SharedPreferences.getInstance();
    if(sharedPref.containsKey(key)){
      sharedPref.remove(key);
    }
  }
}