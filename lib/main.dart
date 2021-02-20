import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail.dart';
import './screens/tab_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: TabsScreen(),
      routes: {
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(this._availableMeals),
        MealDetail.routeName: (context) => MealDetail(),
        FiltersScreen.routeName: (context) => FiltersScreen(
              this._setFilters,
              this._filters,
            ),
      },
      // onGenerateRoute: (settings) {
      // Generates a route if user tries to go to a route that does not exist in the routes table.
      // },
      onUnknownRoute: (settings) {
        // If for some reason an unknown named route is pushed
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }

  void _setFilters(Map<String, bool> filteredData) {
    setState(() {
      this._filters = filteredData;

      this._availableMeals = DUMMY_MEALS.where((meal) {
        if (this._filters['gluten'] && !meal.isGlutenFree) return false;
        if (this._filters['lactose'] && !meal.isLactoseFree) return false;
        if (this._filters['vegan'] && !meal.isVegan) return false;
        if (this._filters['vegetarian'] && !meal.isVegetarian) return false;

        return true;
      }).toList();
    });
  }
}
