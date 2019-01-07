import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'news_data.dart';
import 'dart:async';


class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

Future<List<Br>> _getBr() async {
var brData = await http.get('https://fortnite-api.tresmos.xyz/news?key=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImhhdGVtLmVsbW91Z2hAcHBhLXN0dWRlbnQub3JnIiwidXNlcklkIjoiNWMyZDA3Y2M3OGNmMTgwZmI4MTNkZGU2In0.AolnXMPXgjsXSjxgrO1Cualk9Rk7zz2jAkiaWTvFm98');
var jsonBr = jsonDecode(brData.body);

List<Br> brNews = []; 
  for (var b in jsonBr){
    Br brInfo = Br(b["image"], b["title"], b["body"]);
    brNews.add(brInfo); 
     }
   
print(brNews.length); 


}


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getBr(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return ListView.builder(
      itemCount: snapshot.data == null ? 0 : snapshot.data,
     itemBuilder: (BuildContext context, int index){
       if (snapshot.data == null){
         CircularProgressIndicator(); 
       } else {
         return ListTile(
           title: snapshot.data[index].title,
         );
       }
     },
    ) ; },
    );
   
      
    
  }
}

class News {
    List<Br> br;
    List<Stw> stw;

    News({
        this.br,
        this.stw,
    });
}

class Br {
    String image;
    String title;
    String body;

    Br(
        this.image,
        this.title,
        this.body,
  );
}

class Stw {
    String image;
    String title;
    String body;

    Stw(
        this.image,
        this.title,
        this.body,
    );
}
 