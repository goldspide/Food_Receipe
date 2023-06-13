import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:food_receipe/formulaire.dart';
import 'package:food_receipe/receipe.dart';
import 'package:food_receipe/receipeListeScreen.dart';
import 'package:food_receipe/receipeS.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text("Pizza facile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Text(
                  "Par David Silera",
                  style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                )
              ],
            ),
          ),
          const Icon(Icons.favorite, color: Colors.red),
          const Text("55")
        ],
      ),
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: formulaire()
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // title: "Food_Receipe",
//       // color: Theme.of(context).colorScheme.inversePrimary,
//       // theme: ThemeData(
//       //   primarySwatch: Colors.blueGrey
//       // ),
//       home: ReceipeListeScreen(),
//       // home: ReceipeScreen(receipe: Receipe("Pizza facile", "Par David Silvera", "", 50, "Préparer une pizza de A à Z demande beaucoup de temps, mais le gout de la pizza maison en vaut largement la peine. Préparez séparément la pâte, la sauce et la garniture. Une fois que tous ces éléments sont prêts, assemblez le tout et faites cuire votre pizza à température élevée, jusqu'à ce qu'elle soit délicieusement croustillante. ", false),),
//     );
//   }
// }
//
