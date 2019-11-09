import 'package:flutter/material.dart';
import 'package:foody/dummy-data.dart';
import 'package:foody/models/meal.dart';
import 'package:foody/screens/Filters_screen.dart';
import 'package:foody/screens/categories_screen.dart';
import 'package:foody/screens/category_meal_screen.dart';
import 'package:foody/screens/meal_detail_screen.dart';
import 'package:foody/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters={
    'gluten':false,
    'lactoes':false,
    'vegan':false,
    'vegetarian':false

};
  List<Meal> _availableMeal=DUMMY_MEALS;
  List<Meal> _favouriteMeal=[];
  void _setFilter(Map<String,bool> filterData){
    setState(() {
      _filters=filterData;
      _availableMeal=DUMMY_MEALS.where((meal){
        if(_filters['gluten'] && !meal.isGluteenFree)
          {return false;}
        if(_filters['lactoes'] && !meal.isLactoseFree)
        {return false;}
        if(_filters['vegan'] && !meal.isVegan)
        {return false;}
        if(_filters['vegetarian'] && !meal.isVegetarian)
        {return false;}
        return true;


      }).toList();
    });
  }

  void _toggleFavourite(String mealId){
    final existingIndex=_favouriteMeal.indexWhere((meal)=>mealId==meal.id);
    if(existingIndex>=0)
      {
        setState(() {
          _favouriteMeal.removeAt(existingIndex);
        });
      }
    else{
      setState(() {
        _favouriteMeal.add(
          DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId),

        );
      });
    }

  }
  bool isMealFav(String id){
    return _favouriteMeal.any((meal)=>meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foody',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1)),
      routes: {
        "/": (context) => TabsScreen(_favouriteMeal),
        CategoryMealScreen.routename: (context) => CategoryMealScreen(_availableMeal),
        MealDetail.routeName: (context) => MealDetail(_toggleFavourite,isMealFav),
        FilterScreen.routeName: (context) => FilterScreen(_filters,_setFilter)
      },
    );
  }
}
