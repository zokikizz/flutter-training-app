import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
  length: 2,
  child: Scaffold(
    appBar: AppBar(
      bottom: const TabBar(
        tabs: [
          Tab(icon: Icon(Icons.directions_run)),
          Tab(icon: Icon(Icons.restaurant)),
        ],
      ),
      title: const Text('Traning application'),
    ),
    body: const TabBarView(
      children: [
        Icon(Icons.directions_run, size: 350),
        Icon(Icons.restaurant, size: 350),
      ],
    ),
  ),
);

  }
}
