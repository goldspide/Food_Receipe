import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:food_receipe/receipe.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl ="http://192.168.100.44:3804/";

  static addfood(Map data) async{
    var url = Uri.parse("${baseUrl}food");
    try{
      final res = await http.post(url, body:data);

      if(res.statusCode == 200){
        var data = jsonDecode(res.body.toString());
        print(data);

      }else{
        print("failed to get response");

      }

    }catch (e){
      debugPrint(e.toString());

    }
  }

  static getfood(Map data) async{
    List<Receipe> food =[];
    var url = Uri.parse("${baseUrl}food");

    try{
      final res = await http.get(url);

      if(res.statusCode == 200){
        var data = jsonDecode(res.body);
        // data['foods'].forEach(
        //     (value) => {
        //       food.add(
        //         Receipe(title: value['title'], user: value['user'], imageUrl:value['imageUrl'], favoriteCount: value['favoriteCount']),
        //       ),
        //     },
        // );
        return food;
      }else{

      }

    }catch (e){
      print(e.toString());

    }

  }

  static updateFood(id) async {
    var url = Uri.parse("${baseUrl}food/:$id");
    final res = await http.delete(url);
    if(res.statusCode == 200){
      print(jsonDecode(res.body));
    }else{
      print("failed to delete");
    }
  }
}
