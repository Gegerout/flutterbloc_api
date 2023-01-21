import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_api/internet_cubit.dart';
import 'package:flutterbloc_api/screens/search_episode_page.dart';
import 'package:flutterbloc_api/screens/search_origin_page.dart';
import 'package:flutterbloc_api/screens/search_user_page.dart';
import 'package:flutterbloc_api/widgets/repository_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: isKeyboardOpen
          ? null : BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Origins',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Episodes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class InternetCheck extends StatelessWidget {
  const InternetCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InternetCubit>(
      create: (_) => InternetCubit(connectivity: Connectivity()),
      child: Scaffold(
        body: BlocListener<InternetCubit, ConnectivityResult>(
          listener: (context, state) {
            if(state == ConnectivityResult.none) {
              Fluttertoast.showToast(msg: "no internet connection");
            }
            if(ConnectivityResult.values.isNotEmpty) {
              Fluttertoast.showToast(msg: "internet connected");
            }
          },
          child: Container(),
        ),
    ),);
  }
}


