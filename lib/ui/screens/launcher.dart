// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-07-29
import 'package:flutter/material.dart';
import 'package:onlinerequestsystem/ui/screens/navigation_bar/main_third.dart';
import 'package:onlinerequestsystem/ui/screens/navigation_bar/main_profile.dart';
import 'package:onlinerequestsystem/ui/screens/navigation_bar/main_second.dart';
import 'package:onlinerequestsystem/utils/helper.dart';

class Launcher extends StatefulWidget {
  static const routeName = '/RequestListPage';

  @override
  State<StatefulWidget> createState() {
    return _LauncherState();
  }
}

class _LauncherState extends State<Launcher> {
  int _selectedIndex = 0;
  List<Widget> _pageWidget = <Widget>[
    ProfilePage(),
    MainSecondPage(),
    MainThirdPage()
  ];

  List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.assignment),
      title: Text('Request'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.assignment_turned_in),
      title: Text('Approve'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: HelperColorsTemplete.myCustomColor,
        unselectedItemColor: Colors.grey,  
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }
}
