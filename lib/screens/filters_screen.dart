import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> setFilters;

  FiltersScreen(this.saveFilters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    this._glutenFree = widget.setFilters['gluten'];
    this._lactoseFree = widget.setFilters['lactose'];
    this._vegan = widget.setFilters['vegan'];
    this._vegetarian = widget.setFilters['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': this._glutenFree,
                'lactose': this._lactoseFree,
                'vegan': this._vegan,
                'vegetarian': this._vegetarian,
              };

              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection 😉',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                this._buildSwitchList(
                  'Gluten-free',
                  this._glutenFree,
                  'Only include gluten-free meals.',
                  (newVal) {
                    setState(() {
                      this._glutenFree = newVal;
                    });
                  },
                ),
                this._buildSwitchList(
                  'Vegetarian',
                  this._vegetarian,
                  'Only include vegetarian meals.',
                  (newVal) {
                    setState(() {
                      this._vegetarian = newVal;
                    });
                  },
                ),
                this._buildSwitchList(
                  'Vegan',
                  this._vegan,
                  'Only include vegan meals.',
                  (newVal) {
                    setState(() {
                      this._vegan = newVal;
                    });
                  },
                ),
                this._buildSwitchList(
                  'Lactose-free',
                  this._lactoseFree,
                  'Only include lactose-free meals.',
                  (newVal) {
                    setState(() {
                      this._lactoseFree = newVal;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchList(
      String title, bool value, String subtitle, Function update) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: update,
    );
  }
}
