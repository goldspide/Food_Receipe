import 'package:flutter/material.dart';
import 'package:food_receipe/Api.dart';

class UpdateFood extends StatefulWidget {
  const UpdateFood({Key? key}) : super(key: key);

  @override
  State<UpdateFood> createState() => _UpdateFoodState();
}

class _UpdateFoodState extends State<UpdateFood> {
  var title = TextEditingController();
  var user = TextEditingController();
  var imageurl = TextEditingController();
  var isFavorite = TextEditingController();
  var favoriteCount = TextEditingController();
  var description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("mettre a jour les donnees"),
        backgroundColor: Colors.deepPurple.withOpacity(0.3),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextField(
                  controller: title,
                  decoration: const InputDecoration(
                      hintText: "Entre le nom du repas",
                      prefixIcon: Icon(Icons.verified_user_outlined),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: TextEditingController(text: "dfdf"),
                  decoration: const InputDecoration(
                      hintText: "Entre votre nom",
                      prefixIcon: Icon(Icons.verified_user_outlined),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: description,
                  decoration: const InputDecoration(
                      hintText: "Entre la description du repas",
                      prefixIcon: Icon(Icons.verified_user_outlined),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: imageurl,
                  decoration: const InputDecoration(
                      hintText: "insere le lien de l\'image",
                      prefixIcon: Icon(Icons.verified_user_outlined),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: isFavorite,
                  decoration: const InputDecoration(
                      hintText: "Entre true ou false",
                      prefixIcon: Icon(Icons.verified_user_outlined),
                      border: OutlineInputBorder()),
                ),
                // TextField(
                //   controller: favoriteCount,
                //   decoration: const InputDecoration(
                //       hintText: "Entre le nom du repa"
                //   ),
                // )

                const SizedBox(
                  height: 15,
                ),

                ElevatedButton(
                    onPressed: () {
                      var data = {
                        "title": title.text,
                        "user": user.text,
                        "imageUrl": imageurl.text,
                        "isFavorite": isFavorite.text,
                        "description": description
                      };

                      Api.addfood(data);
                      setState(() {
                        title.text = "";
                        user.text = "";
                        imageurl.text = "";
                        isFavorite.text = "";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.withOpacity(0.3),
                      // side: const BorderSide(color: Colors.cyan),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("update",style: TextStyle(color: Colors.black)))
              ]),
            )),
      ),
    );
  }
}
