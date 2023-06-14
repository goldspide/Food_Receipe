import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:food_receipe/Api.dart';
import 'package:food_receipe/insert.dart';
import 'package:food_receipe/update.dart';
import 'package:http/http.dart' as http;

class FecthData extends StatefulWidget {
  const FecthData({Key? key}) : super(key: key);
  static const baseUrl = "http://192.168.100.44:3804/";

  @override
  State<FecthData> createState() => _FecthDataState();
}

class _FecthDataState extends State<FecthData> {
  List food = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    this.fetchFood();
  }

  fetchFood() async {
    const baseUrl = "http://192.168.100.44:3804/";
    var url = Uri.parse("${baseUrl}food");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['foods'];
      print(items);
      setState(() {
        food = items;
      });
    } else {
      setState(() {
        food = [];
      });
    }
  }

  deleteFood(id) async{
    const baseUrl = "http://192.168.100.44:3804/";
    var url = Uri.parse("${baseUrl}food/$id");
    var response = await http.delete(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['foods'];
      print(items);
      setState(() {
        food = items;
      });
    } else {
      setState(() {
        food = [];
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food list"),
      ),
      body: getBody(),
      // body: FutureBuilder(
      //
      //   future: Api.getfood(),
      //     builder: (BuildContext context, AsyncSnapshot snapshot)
      // ),
    );
  }

  Widget getBody() {
    // List items = ["1", "2"];
    return ListView.builder(
        itemCount: food.length,
        itemBuilder: (context, index) {
          return getCard(food[index]);
        });
  }

  Widget getCard(index) {
    var user = index['user'];
    var title = index['title'];
    var ide = index['_id'];
    // var don = id.toString();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(60 / 2),
                    image: const DecorationImage(
                        image: AssetImage("images/pizza.jpeg"))),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          user.toString(),
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          title.toString(),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(width: 50,),
                    IconButton(
                        onPressed: () {
                        }, icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          // Api.getfood(id);
                          // food.removeAt(id);
                          deleteFood(ide);
                          print(ide);
                          setState(() {});

                        }, icon: const Icon(Icons.delete)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
