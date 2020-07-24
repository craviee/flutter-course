import 'package:flutter/material.dart';
import 'package:mealApp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routerName = '/filters-screen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;

  @override
  initState()
  {
      _glutenFree = widget.currentFilters['gluten'];
      _vegetarian = widget.currentFilters['vegetarian'];
      _vegan = widget.currentFilters['vegan'];
      _lactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subTitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: (){
            final Map<String, bool> filters = {
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegetarian': _vegetarian,
            'vegan': _vegan
          };
          widget.saveFilters(filters);
        })],
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal sleection',
                style: Theme.of(context).textTheme.headline6,
              )),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              buildSwitchListTile('Lactose-free',
                  'Only include lactose-free meals', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              buildSwitchListTile(
                  'Vegetarian-free',
                  'Only include vegetarian-free meals',
                  _vegetarian, (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              buildSwitchListTile(
                  'Vegan-free', 'Only include vegan-free meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
