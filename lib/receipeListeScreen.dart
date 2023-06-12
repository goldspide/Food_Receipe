import 'package:flutter/material.dart';
import 'package:food_receipe/receipe.dart';

class ReceipeListeScreen extends StatelessWidget {
  const ReceipeListeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes recettes"),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.fastfood),
            title:Text('Burger maison'),
          )
        ],
      ),
    );
  }
}

// class RecipeItemWidget extends StatelessWidget{
//   const ReceipeItemWiget ({Key key, required this.receipe}) : super(key key);
//   final Receipe receipe;
//   @override
//   Widget build(BuildContext context){
//
//   }
// }