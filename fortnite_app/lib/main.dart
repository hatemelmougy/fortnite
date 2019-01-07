import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(Fnbr());

class Fnbr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortnite app',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.purple,
        fontFamily: "Burbank",
      ),
      home: HomePage(),
    );
  }
}

