import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
var stats;
Future<String> getNews() async {
    var response = await http.get(
        'https://fortnite-api.tresmos.xyz/news?key=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImhhdGVtLmVsbW91Z2hAcHBhLXN0dWRlbnQub3JnIiwidXNlcklkIjoiNWMyZDA3Y2M3OGNmMTgwZmI4MTNkZGU2In0.AolnXMPXgjsXSjxgrO1Cualk9Rk7zz2jAkiaWTvFm98');
    print(response.body);
    this.setState(() {
      stats = jsonDecode(response.body);
    });
    
    }
    @override
    void initState() {
      super.initState();
      this.getNews();
  }





  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Stats'),
      
    );
  }
}