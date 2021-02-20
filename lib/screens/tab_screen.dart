import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // Top Tab Bar
  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 2,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: Text('Meals'),
  //         bottom: TabBar(
  //           tabs: [
  //             Tab(
  //               icon: Icon(Icons.category),
  //               text: 'Categories',
  //             ),
  //             Tab(
  //               icon: Icon(Icons.star),
  //               text: 'Favourites',
  //             ),
  //           ],
  //         ),
  //       ),
  //       body: TabBarView(
  //         children: [
  //           CategoriesScreen(),
  //           FavoritesScreen(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  //Bottom Tab Bar
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Favorites'},
  ];
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._pages[this._selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: this._pages[this._selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: this._selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: this._selectedPageIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        // For shifting type
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            // Use when type is shifting
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      this._selectedPageIndex = index;
    });
  }
}
