import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_receipe/insert.dart';
import 'package:food_receipe/receipe.dart';
import 'package:food_receipe/receipeS.dart';
import 'package:food_receipe/update.dart';
import 'package:http/http.dart' as http;

class FecthData extends StatefulWidget {
  const FecthData({Key? key}) : super(key: key);
  static const baseUrl = "http://192.168.100.44:3805/";

  @override
  State<FecthData> createState() => _FecthDataState();
}

class _FecthDataState extends State<FecthData> {
  List<Receipe> food = [] ;
  // bool isLoading = false;
  @override
  void initState() {
    super.initState();
    // this.fetchFood();
  }

  fetchFood() async {
    const baseUrl = "http://192.168.100.44:3805/";
    var url = Uri.parse("${baseUrl}food");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print(items);
      for(var data in items){
        food.add(Receipe(  data['title'],
          data['user'],
          data['imageUrl'],
          data['favoriteCount'],
          data['description'],
          data['isFavorite'],
          data['_id']));
      }
      setState(() {
        // food = items.map((e) => Receipe.fromMap(e));
        });
      food.forEach((someData)=>print("nom : ${someData.title}"));
      print(food);
    } else {
      setState(() {
        food = [];
      });
    }
  }

  deleteFood(id) async {
    const baseUrl = "http://192.168.100.44:3805/";
    var url = Uri.parse("${baseUrl}food/$id");
    var response = await http.delete(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['foods'];
      // print(items);
      setState(() {
        food = items;
      });
    } else {
      setState(() {
        food = [];
      });
    }
  }
  updateFood(id) async {
    const baseUrl = "http://192.168.100.44:3805/";
    var url = Uri.parse("${baseUrl}food/$id");
    var response = await http.patch(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['foods'];
      // print(items);
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
        backgroundColor: Colors.deepPurple.withOpacity(0.3),
        centerTitle: true,
      ),
      body: getBody(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (
                  _,
                  __,
                  ___,
                  ) =>
              const CreateFood()),
          // MaterialPageRoute(builder: (__){return ProfileScreen();}),
        );
      }, child: const Icon(Icons.add),),
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
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(color: Colors.blue,);
              getCard(food[index]);

              Dismissible(
                  key: Key(food[index].id),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      food.removeAt(index);
                      deleteFood(food[index].id);
                      print(food[index].id);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${food[index].title} supprimer avec succes"),
                    ));
                  },
                  background: Container(
                    color: Colors.red.withOpacity(0.3),
                    child: const Icon(Icons.delete,color: Colors.white,),
                  ),
                  child: getCard(food[index]));
        });
  }

  Widget getCard(index) {

    var user = index['user'];
    var title = index['title'];
    var ide = index['_id'];
    var favoriteCount = index['favoriteCount'];
    var fav = index['isFavorite'];
    var desc = index['description'];
    var image = index['imageurl'];
    // var don = id.toString();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ReceipeScreen(receip: food[index],)));
        // ReceipeScreen(title: title.toString(),user: user.toString(),description: desc.toString(),isFavorite: fav, favoriteCount: count, imageUrl: image.toString(),)
      },
      onLongPress: () {
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertDialog(
        //     title: const Text("Notification d'insertion"),
        //     content: const Text('insertion reussi'),
        //     actions: [
        //       SingleChildScrollView(
        //         child: Center(
        //             child: Container(
        //               padding: const EdgeInsets.all(5.0),
        //               child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //                 TextField(
        //                   controller: TextEditingController(text: title.toString()),
        //                   decoration: const InputDecoration(
        //                       hintText: "Entre le nom du repas",
        //                       prefixIcon: Icon(Icons.verified_user_outlined),
        //                       border: OutlineInputBorder()),
        //                 ),
        //                 const SizedBox(
        //                   height: 15,
        //                 ),
        //                 TextField(
        //                   controller: TextEditingController(text: "user.toString()"),
        //                   decoration: const InputDecoration(
        //                       hintText: "Entre votre nom",
        //                       prefixIcon: Icon(Icons.verified_user_outlined),
        //                       border: OutlineInputBorder()),
        //                 ),
        //                 const SizedBox(
        //                   height: 15,
        //                 ),
        //                 TextField(
        //                   controller: TextEditingController(text: "desc.toString()"),
        //                   decoration: const InputDecoration(
        //                       hintText: "Entre la description du repas",
        //                       prefixIcon: Icon(Icons.verified_user_outlined),
        //                       border: OutlineInputBorder()),
        //                 ),
        //                 const SizedBox(
        //                   height: 15,
        //                 ),
        //                 TextField(
        //                   controller: TextEditingController(text: "image.toString()"),
        //                   decoration: const InputDecoration(
        //                       hintText: "insere le lien de l\'image",
        //                       prefixIcon: Icon(Icons.verified_user_outlined),
        //                       border: OutlineInputBorder()),
        //                 ),
        //                 const SizedBox(
        //                   height: 15,
        //                 ),
        //                 TextField(
        //                   controller: TextEditingController(text: "fav.toString()"),
        //                   decoration: const InputDecoration(
        //                       hintText: "Entre true ou false",
        //                       prefixIcon: Icon(Icons.verified_user_outlined),
        //                       border: OutlineInputBorder()),
        //                 ),
        //                 // TextField(
        //                 //   controller: favoriteCount,
        //                 //   decoration: const InputDecoration(
        //                 //       hintText: "Entre le nom du repa"
        //                 //   ),
        //                 // )
        //
        //                 const SizedBox(
        //                   height: 15,
        //                 ),
        //
        //                 ElevatedButton(
        //                     onPressed: () {
        //                       var data = {
        //                         "title": title.text,
        //                         "user": user.text,
        //                         "imageUrl": image.text,
        //                         "isFavorite": fav.text,
        //                         "description": desc.text
        //                       };
        //
        //                       updateFood(ide);
        //                       print(ide);
        //                       setState(() {
        //                         title.text = "";
        //                         user.text = "";
        //                         image.text = "";
        //                         fav.text = "";
        //                       });
        //                     },
        //                     style: ElevatedButton.styleFrom(
        //                       backgroundColor: Colors.deepPurple.withOpacity(0.3),
        //                       // side: const BorderSide(color: Colors.cyan),
        //                       shape: const StadiumBorder(),
        //                     ),
        //                     child: const Text("update",style: TextStyle(color: Colors.black)))
        //               ]),
        //             )),
        //       ),
        //       // TextField(),
        //       TextButton(
        //           onPressed: () {
        //             Navigator.push(
        //               context,
        //               PageRouteBuilder(
        //                   pageBuilder: (
        //                       _,
        //                       __,
        //                       ___,
        //                       ) =>
        //                   const FecthData()),
        //             );
        //           },
        //           child: const Text('Quite')),
        //     ],
        //   ),
        // );

        Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (
            _,
            __,
            ___,
          ) =>
                  const UpdateFood()),
          // MaterialPageRoute(builder: (__){return ProfileScreen();}),
        );
        UpdateFood();
        print("long press");
      },
      onLongPressUp: () {
        print("long press released");
      },
      child: Card(
        elevation: 8,
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
                      const SizedBox(
                        width: 50,
                      ),
                      // IconButton(
                      //     onPressed: () {
                      //     }, icon: const Icon(Icons.edit)),
                      // IconButton(
                      //     onPressed: () {
                      //       // Api.getfood(id);
                      //       // food.removeAt(id);
                      //       deleteFood(ide);
                      //       print(ide);
                      //       setState(() {});
                      //
                      //     }, icon: const Icon(Icons.delete)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
