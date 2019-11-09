import 'package:flutter/material.dart';
import 'package:foody/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "Filter-screen";
  final Function savefilters;
  final Map<String, bool> currentfilters;

  FilterScreen(this.currentfilters, this.savefilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarain = false;
  bool _vegan = false;
  bool _lactoes = false;

/*  @override
  void initState() {
    _glutenFree = widget.currentfilters['gluten'];
    _lactoes = widget.currentfilters['lactoes'];
    _vegan = widget.currentfilters['vegan'];
    _vegetarain = widget.currentfilters['vegetarain'];

    super.initState();
  }*/

  Widget buildSwitchTile(String title, String description, bool currentvalue,
      Function updatevalue) {
    return SwitchListTile(
      value: currentvalue,
      onChanged: updatevalue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.currentfilters);
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                splashColor: Colors.white,
                icon: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                onPressed: () {
                  final selectedFilter = {
                    'gluten': _glutenFree,
                    'lactoes': _lactoes,
                    'vegan': _vegan,
                    'vegetarian': _vegetarain
                  };
                  widget.savefilters(selectedFilter);
                }),
          ],
          title: Text("Yours Filters"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Adjust your meal Selection",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                buildSwitchTile("Gluten-Free", "Only include Gluten-Free Meals",
                    _glutenFree, (newvalue) {
                  setState(() {
                    _glutenFree = newvalue;
                  });
                }),
                buildSwitchTile(
                    "Lactose-Free", "Only include Lactose-Free Meals", _lactoes,
                    (newvalue) {
                  setState(() {
                    _lactoes = newvalue;
                  });
                }),
                buildSwitchTile("Vegetarain-Food",
                    "Only include Vegetarain Meals", _vegetarain, (newvalue) {
                  setState(() {
                    _vegetarain = newvalue;
                  });
                }),
                buildSwitchTile(
                    "Vegan-Food", "Only include Vegan Meals", _vegan,
                    (newvalue) {
                  setState(() {
                    _vegan = newvalue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
