import 'package:aura_mind/Screens/Appointment%20Screen/appointment.dart';
import 'package:aura_mind/Screens/Discover%20Screen/discover.dart';
import 'package:aura_mind/Screens/Home%20Screen/home.dart';
import 'package:aura_mind/Screens/Message%20Screen/message.dart';
import 'package:aura_mind/Screens/Profile%20Screen/profile.dart';
import 'package:flutter/material.dart';

class BottomnavScreen extends StatefulWidget {
  const BottomnavScreen({super.key});

  @override
  State<BottomnavScreen> createState() => _BottomnavScreenState();
}

class _BottomnavScreenState extends State<BottomnavScreen> {
  int currentIndex = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const DiscoverScreen(),
    const MessageScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        iconSize: 30,
        unselectedIconTheme: const IconThemeData(color: Colors.black),
        selectedItemColor: const Color(0XFFEBD82F),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp), label: ""),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Appointment()));
        },
        shape: CircleBorder(),
        backgroundColor: Color(0XFFEBD82F),
        child: Icon(
          Icons.calendar_month_outlined,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
