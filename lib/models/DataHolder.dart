import 'package:shared_preferences/shared_preferences.dart';

class DataHolder{
  static const isGlutenFreeKey = "isGlutenFree";
  static const isLactoseFree = "isLactoseFree";
  static const isVeganFree = "isVegan";
  static const isVegetrationFree = "isVegetarian";
  static const MealListId = "Meals001";

  DataHolder._(){
    _filters = {
      DataHolder.isGlutenFreeKey : false,
      DataHolder.isLactoseFree : false,
      DataHolder.isVeganFree : false,
      DataHolder.isVegetrationFree : false
    };
    _MealIds = [];
  }
  late Map<String, bool> _filters;
  static DataHolder? _dataHolder;
  late List<String> _MealIds;
  static DataHolder getInstance(){
    if(_dataHolder == null){
      _dataHolder = DataHolder._();
    }
    return _dataHolder!;
  }
  Map<String, bool> get getFilters{
    return _filters;
  }
  void setFiltersIteM(String key, bool value){
    _filters[key] = value;
  }
   void setInitialFilters() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    List keys = sharedPreferences.getKeys().toList();
    if(keys.isNotEmpty){
      print("keys not eMpty");
      print(keys[0]);
        for(int i = 0; i < keys.length; i++){
          switch(keys[i]){
            case DataHolder.isGlutenFreeKey :
              bool glutenFree = sharedPreferences.getBool(keys[i])!;
              _dataHolder!.setFiltersIteM(DataHolder.isGlutenFreeKey, glutenFree);
              break;
            case DataHolder.isLactoseFree :
              bool lactose = sharedPreferences.getBool(keys[i])!;
              _dataHolder!.setFiltersIteM(DataHolder.isLactoseFree, lactose);
              break;
            case DataHolder.isVeganFree :
              bool veganFree = sharedPreferences.getBool(keys[i])!;
              _dataHolder!.setFiltersIteM(DataHolder.isVeganFree, veganFree);
              break;
            case DataHolder.isVegetrationFree :
              bool vegetrian = sharedPreferences.getBool(keys[i])!;
              _dataHolder!.setFiltersIteM(DataHolder.isVegetrationFree, vegetrian);
              break;
          }
        }

    }
  }
  void setFavouriate(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> ids = sharedPreferences.getStringList(MealListId)!;
    if(!(ids.contains(id))){
      ids.add(id);
      sharedPreferences.setStringList(MealListId, ids);
      _MealIds.add(id);
    }
  }
  void setInitialFavouriatesRecipes() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.containsKey(MealListId)){
      _MealIds = sharedPreferences.getStringList(MealListId)!;
    }
    else{
      sharedPreferences.setStringList(MealListId, _MealIds);
    }
  }
  List<String> get getMeals{
    return _MealIds;
  }
}