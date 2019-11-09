import 'package:flutter/material.dart';
import 'package:foody/models/meal.dart';
import 'package:foody/screens/categories_screen.dart';
import 'package:foody/screens/favourite_screen.dart';
import 'package:foody/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favourieMeals;

  TabsScreen(this.favourieMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    _pages = [
      {"page": CategoriesScreen(), "title": "Categories"},
      {"page": FavouriteScreen(widget.favourieMeals), "title": "Your Favourite"}
    ];
    super.initState();
  }

  List<Map<String, Object>> _pages;
  int _selectPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectPageIndex = index;
          });
        },
        currentIndex: _selectPageIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.pink,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(
                Icons.category,
                //color: Colors.white,
              ),
              title: Text(
                "Categories",
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(
                Icons.star,
                //color: Colors.white,
              ),
              title: Text(
                "Favourites",
              ))
        ],
      ),
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]["title"]),
      ),
      body: _pages[_selectPageIndex]["page"],
    );
  }
}
