import 'package:flutter/material.dart';
import 'package:salon_customer_app/presentation/pages/home/home_page.dart';

import '../category/category_page.dart';
import '../salon list/presentation/salon_list_page.dart';
import 'bottom_navigation_menu/bottom_navigation_menu.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var selectedIndex = 0;

  static const List<Widget> tabs = <Widget>[
    HomePage(),
    CategoryPage(),
    SalonListPage()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigatipnMenu(
          index: selectedIndex, onItemTapped: onItemTapped),
      body: SafeArea(child: tabs.elementAt(selectedIndex)),
    );
  }
}
