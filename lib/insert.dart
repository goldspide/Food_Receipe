import 'package:flutter/material.dart';
import 'package:food_receipe/Api.dart';
import 'package:food_receipe/fetch.dart';

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
  var description = TextEditingController();
  List listItems = ['true', 'false'];
  var choosen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page D'inserrtion De Donnees"),
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
              height: 10,
            ),
            TextField(
              controller: user,
              decoration: const InputDecoration(
                  hintText: "Entre votre nom",
                  prefixIcon: Icon(Icons.verified_user_outlined),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: imageurl,
              decoration: const InputDecoration(
                  hintText: "insere le lien de l\'image",
                  prefixIcon: Icon(Icons.verified_user_outlined),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: description,
              decoration: const InputDecoration(
                  hintText: "Entre la description du repas",
                  prefixIcon: Icon(Icons.verified_user_outlined),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            // DropdownButton(items:listItems.map((e) => valueItem), onChanged: (newValue) {
            //   setState(() {
            //     choosen = newValue;
            //   });
            // }),
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
              height: 20,
            ),

            ElevatedButton(
                onPressed: () {
                  var data = {
                    "title": title.text,
                    "user": user.text,
                    "imageUrl": imageurl.text,
                    "isFavorite": isFavorite.text,
                    "description": description.text
                  };
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Notification d'insertion"),
                      content: const Text('insertion reussi'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (
                                  _,
                                  __,
                                  ___,
                                ) =>
                                        const FecthData()),
                              );
                            },
                            child: const Text('Quite')),
                      ],
                    ),
                  );
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
                  // side: const BorderSide(color: Colors.deepPurple),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  "submit",
                  style: TextStyle(color: Colors.black),
                )),
          ]),
        )),
      ),
    );
  }
}
