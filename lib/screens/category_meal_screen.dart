import 'package:flutter/material.dart';
import 'package:foody/dummy-data.dart';
import 'package:foody/models/meal.dart';
import 'package:foody/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static String routename = "category-meal";
  final List<Meal> availableMeal;
  CategoryMealScreen(this.availableMeal);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categorytitle;
  List<Meal> displayMeals;
  var initdata=false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!initdata){
      var routeArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
      final String categoryid = routeArg["id"];
      categorytitle = routeArg["title"];
      displayMeals = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryid);
      }).toList();
      initdata=true;
    }
    super.didChangeDependencies();

  }

  void _removeMeal(String mealId){
setState(() {
  displayMeals.removeWhere((meal)=>meal.id==mealId);
});
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(categorytitle),
        ),
        body: ListView.builder(
            itemCount: displayMeals.length,
            itemBuilder: (context, index) {
              return MealItem(
                id: displayMeals[index].id,
                title: displayMeals[index].title,
                affordability: displayMeals[index].affordability,
                complexity: displayMeals[index].complexity,
                duration: displayMeals[index].duration,
                imageUrl: displayMeals[index].imageUrl,

              );
            }));
  }
}
