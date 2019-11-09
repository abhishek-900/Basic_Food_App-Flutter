import 'package:flutter/material.dart';
import 'package:foody/models/meal.dart';
import 'package:foody/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;

  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  MealItem(
      {@required this.id,
        @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      });

  selectMeal(BuildContext context) {
    Navigator.pushNamed(context, MealDetail.routeName,arguments: id).then((result){
      if(result!=null)
        {
          //removeItem(result);
        }
      print(result);

    });
  }
  String get complexityText{
    if(complexity==Complexity.Challenging)
      return "Challenging";
    else if(complexity==Complexity.Simple)
      return "Simple";
    else {
      return "Affordable";
    }
  }
  String get affordabiltyText{
    if(affordability==Affordability.Affordable)
      return "Affordable";
    else if(affordability==Affordability.Luxurious)
      return "Luxurious";
    else {
      return "pricey";
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectMeal(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      //bottomLeft: Radius.circular(15),
                      //bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 250,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabiltyText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
