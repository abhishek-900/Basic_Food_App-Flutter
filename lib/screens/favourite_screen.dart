import 'package:flutter/material.dart';
import 'package:foody/models/meal.dart';
import 'package:foody/widgets/meal_item.dart';
class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return Center(
        child: Text("You have no Favourite Yet!",style: TextStyle(fontWeight: FontWeight.bold),),
      );
    }
    else{
      return ListView.builder(
          itemCount: favouriteMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              affordability: favouriteMeals[index].affordability,
              complexity:favouriteMeals[index].complexity,
              duration: favouriteMeals[index].duration,
              imageUrl: favouriteMeals[index].imageUrl,

            );
          });

    }

  }
}
