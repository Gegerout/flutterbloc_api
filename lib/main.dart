import 'package:flutter/material.dart';
import 'package:flutterbloc_api/screens/search_episode_page.dart';
import 'package:flutterbloc_api/screens/search_origin_page.dart';
import 'package:flutterbloc_api/screens/search_user_page.dart';
import 'package:flutterbloc_api/widgets/repository_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    RepositoryWidget(page: SearchUserPage()),
    RepositoryWidget(page: SearchOriginPage()),
    RepositoryWidget(page: SearchEpisodePage())
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Origins',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Episodes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

