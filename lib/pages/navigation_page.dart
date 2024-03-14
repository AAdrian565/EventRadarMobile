import 'package:event_radar2/pages/home_screen.dart';
import 'package:event_radar2/pages/schedule/schedule_screen.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPage();
}

class _NavigationPage extends State<NavigationPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildNavigationBar(),
    );
  }

  Widget buildBody() {
    return SafeArea(
      child: IndexedStack(
        index: currentPageIndex,
        children: const <Widget>[
          HomePage(),
          SchedulePage(), // NOTE: Add some page here
          HomePage(), // NOTE: Add some page here
          HomePage(), // NOTE: Add some page here
        ],
      ),
    );
  }

  Widget buildNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: buildNavigationBarWidget(currentPageIndex),
    );
  }

  Widget buildNavigationBarWidget(int currentIndex) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue[800],
      unselectedItemColor: Colors.black,
      // showUnselectedLabels: false,
      onTap: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      currentIndex: currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          activeIcon: Icon(Icons.calendar_month),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined),
          activeIcon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          activeIcon: Icon(Icons.person_2_sharp),
          label: 'Profile',
        ),
      ],
    );
  }
}
