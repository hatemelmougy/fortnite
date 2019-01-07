import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class ItemShop extends StatefulWidget {
  @override
  _ItemShopState createState() => _ItemShopState();
}

List items;

class _ItemShopState extends State<ItemShop> {
  Future<String> itemShop() async {
    var response = await http.get(
        'https://fortnite-api.tresmos.xyz/store?key=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImhhdGVtLmVsbW91Z2hAcHBhLXN0dWRlbnQub3JnIiwidXNlcklkIjoiNWMyZDA3Y2M3OGNmMTgwZmI4MTNkZGU2In0.AolnXMPXgjsXSjxgrO1Cualk9Rk7zz2jAkiaWTvFm98');
    print(response.body);
    this.setState(() {
      items = jsonDecode(response.body);
    });
  }

  void initState() {
    super.initState();
    this.itemShop();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items == null ? 0 : items.length,
        
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: Column(children: <Widget>[
                Image.network(items[index]['images']["background"],
                height: 350,
                width: 350,
                ),
                ListTile(

               contentPadding: EdgeInsets.all(10.0),
                  title: Text(
                    items[index]["name"],
                    style: TextStyle(fontSize: 25.0),
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Image.network(
                        'https://vignette.wikia.nocookie.net/fortnite/images/5/5a/Icon_VBucks.png/revision/latest?cb=20170806013747',
                        height: 30.0,
                        width: 30.0,
                      ),
                      Text(items[index]["cost"], style: TextStyle(fontSize: 25.0),),
                    ],
                  )),  
                
               
              ],)
              );
        });
  }
}
