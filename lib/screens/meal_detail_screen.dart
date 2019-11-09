import 'package:flutter/material.dart';
import 'package:foody/dummy-data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = "/meal-detail";
  final Function toggleFavourite;
  final Function isMealFav;
  MealDetail(this.toggleFavourite,this.isMealFav);

  Widget buildSectionTitle(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildContainer(Widget child, BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 150,
        width: MediaQuery.of(context).size.width * 0.8,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 290,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle("Ingredients"),
              buildContainer(
                  ListView.builder(
                      itemCount: selectedMeal.ingredients.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(selectedMeal.ingredients[index]),
                          ),
                        );
                      }),
                  context),
              buildSectionTitle("Steps "),
              buildContainer(
                  ListView.builder(
                      itemCount: selectedMeal.steps.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                child: Text("# ${(index + 1)}"),
                              ),
                              title: Text(selectedMeal.steps[index]),
                            ),
                            Divider(
                              color: Colors.black54,
                            )
                          ],
                        );
                      }),
                  context)
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
          child: Icon(

            isMealFav(mealId)?Icons.favorite:Icons.favorite_border,color: Colors.red,),
          onPressed:()=> toggleFavourite(mealId)),
    );
  }
}
