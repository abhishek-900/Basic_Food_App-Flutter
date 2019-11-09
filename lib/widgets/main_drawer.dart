import 'package:flutter/material.dart';
import 'package:foody/screens/Filters_screen.dart';

class MainDrawer extends StatelessWidget {

  ListTile getTitle(IconData icon,String title,Function handler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
      onTap: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up !",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          getTitle(Icons.restaurant, "Meals",(){
            Navigator.pushReplacementNamed(context, "/");
          }),
         Divider(color: Colors.black54,),
         getTitle(Icons.settings, "Filters",(){
           Navigator.pushReplacementNamed(context, FilterScreen.routeName);
         })
        ],
      ),
    );
  }
}
