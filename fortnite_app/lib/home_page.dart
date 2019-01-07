import 'package:flutter/material.dart';
import 'stats.dart';
import 'item_shop.dart';
import 'news.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final _pageOptions = [
    NewsPage(),
    ItemShop(),
    Stats(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.purple,
          title: Text(
            "FNBR APP",
            style: TextStyle(
              fontFamily: 'Burbank',
              letterSpacing: 1.5,
              fontSize: 25.0,
            ),
          )),
      body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: Colors.white,
          ),
          child: 
          _pageOptions[_selectedPage], 
       ),
      bottomNavigationBar: BottomNavigationBar(
        
          fixedColor: Colors.purple,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.public),
              title: Text('News'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              title: Text('Item Shop'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Stats'),
            ),
          ]),
    );
  }
}
