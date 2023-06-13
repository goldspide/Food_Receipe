import 'package:flutter/material.dart';
import 'package:food_receipe/Api.dart';

class CreateFood extends StatefulWidget {
  const CreateFood({Key? key}) : super(key: key);

  @override
  State<CreateFood> createState() => _CreateFoodState();
}

class _CreateFoodState extends State<CreateFood> {
  var title = TextEditingController();
  var user = TextEditingController();
  var imageurl = TextEditingController();
  var isFavorite = TextEditingController();
  var favoriteCount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page d'inserrtion de Donnees"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            TextField(
              controller: title,
              decoration: const InputDecoration(
                hintText: "Entre le nom du repas"
              ),
            ),
            TextField(
              controller: user,
              decoration: const InputDecoration(
                  hintText: "Entre votre nom"
              ),
            ),
            TextField(
              controller: imageurl,
              decoration: const InputDecoration(
                  hintText: "insere le lien de l\'image"
              ),
            ),
            TextField(
              controller: isFavorite,
              decoration: const InputDecoration(
                  hintText: "Entre true ou false"
              ),
            ),
            // TextField(
            //   controller: favoriteCount,
            //   decoration: const InputDecoration(
            //       hintText: "Entre le nom du repa"
            //   ),
            // )

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(onPressed: () {
              var data = {
                "title":title.text,
                "user":user.text,
                "imsgeUrl":imageurl.text,
                "isFavorite":isFavorite.text
              };
              Api.addfood(data);
            }, child: const Text("submit")),
          ]
        )
      ),
    );
  }
}
