import 'package:flutter/material.dart';

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