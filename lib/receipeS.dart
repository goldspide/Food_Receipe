import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:food_receipe/favorit.dart';
import 'package:food_receipe/receipe.dart';
import 'package:http/http.dart' as http;

class ReceipeScreen extends StatefulWidget {

  final Receipe receip;

  const ReceipeScreen({super.key, required this.receip});

  @override
  State<ReceipeScreen> createState() => _ReceipeScreenState();
}

class _ReceipeScreenState extends State<ReceipeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Mes recettes"),
      ),
      body: ListView(
        children: [
           Image(image: AssetImage(widget.receip.imageUrl),fit: BoxFit.cover,width: 600,height: 240,),
          // CachedNetworkImage(
          //   imageUrl: 'https://fr.depositphotos.com/56359867/stock-photo-hot-homemade-pepperoni-pizza.jpeg',
          //   placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          //   errorWidget: (context, url, error) => const Icon(Icons.error),
          //   width: 600,
          //   height: 240,
          //   fit: BoxFit.cover,
          // ),
          Container(
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
                        child:  Text(widget.receip.title,
                            style:
                            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      Text(
                        "Par ${widget.receip.user}",
                        style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                      )
                    ],
                  ),
                ),
                 FavoriteWidget(isFavorited: widget.receip.isFavorite, favoriteCount: widget.receip.favoriteCount,)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Icon(Icons.comment, color:  Colors.blue),
                    ),
                    const Text("comment", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.blue),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Icon(Icons.share, color:  Colors.blue),
                    ),
                    const Text("comment", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.blue),)
                  ],
                )
              ],
            ),
          ),
          Container(
        padding: const EdgeInsets.all(32),
        child:  Text(
          widget.receip.description,
          softWrap: true,
        ),
      )
        ],),);
  }

}























// Column _buildButtomColumn(Color color, IconData icon, String label) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Container(
//           padding: const EdgeInsets.only(bottom: 8),
//           child: Icon(
//             icon,
//             color: color,
//           )),
//       Text(
//         label,
//         style: TextStyle(
//             fontSize: 14, fontWeight: FontWeight.w400, color: color),
//       )
//     ],
//   );
// }


//
// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:food_receipe/favorit.dart';
// import 'package:food_receipe/receipe.dart';
//
//
// class ReceipeScreen extends StatelessWidget {
//   // const ReceipeScreen({Key key, required this.receipe}) : super(key: key);
//   ReceipeScreen({super.key, required this.receipe});
//   final Receipe receipe;
//
//
//
//
//   @override
//   Widget titleSection = Container(
//     padding: const EdgeInsets.all(8),
//     child: Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(bottom: 8),
//                 child:  Text(receipe.title,
//                     style:
//                     TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//               ),
//               Text(
//                 receipe.user,
//                 style: TextStyle(fontSize: 16, color: Colors.grey[500]),
//               )
//             ],
//           ),
//         ),
//         FavoriteWidget(isFavorited: receipe.isFavorite, favoriteCount: receipe.favoriteCount,)
//       ],
//     ),
//   );
//   Widget buttomSection = Container(
//     padding: const EdgeInsets.all(8),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               child: const Icon(Icons.comment, color:  Colors.blue),
//             ),
//             const Text("comment", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.blue),)
//           ],
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               child: const Icon(Icons.share, color:  Colors.blue),
//             ),
//             const Text("comment", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.blue),)
//           ],
//         )
//         // _buildButtomColumn(Colors.blue, Icons.comment, "Comment"),
//         // _buildButtomColumn(Colors.blue, Icons.share, "share")
//       ],
//     ),
//   );
//   Widget descriptionSection = Container(
//     padding: const EdgeInsets.all(32),
//     child: Text(
//       receipe.description,
//       softWrap: true,
//     ),
//   );
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title:  Text(receipe.title),
//       ),
//       body: ListView(
//         children: [
//           CachedNetworkImage(
//             imageUrl: receipe.imageUrl,
//             placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//             errorWidget: (context, url, error) => const Icon(Icons.error),
//             width: 600,
//             height: 240,
//             fit: BoxFit.cover,
//           ),
//           titleSection,
//           buttomSection,
//           descriptionSection
//         ],),);
//   }
//   Column _buildButtomColumn(Color color, IconData icon, String label) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//             padding: const EdgeInsets.only(bottom: 8),
//             child: Icon(
//               icon,
//               color: color,
//             )),
//         Text(
//           label,
//           style: TextStyle(
//               fontSize: 14, fontWeight: FontWeight.w400, color: color),
//         )
//       ],
//     );
//   }
// }
//
// Widget titleSection = Container(
//   padding: const EdgeInsets.all(8),
//   child: Row(
//     children: [
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: const Text("Pizza facile",
//                   style:
//                   TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//             ),
//             Text(
//               "Par David Silera",
//               style: TextStyle(fontSize: 16, color: Colors.grey[500]),
//             )
//           ],
//         ),
//       ),
//       const FavoriteWidget(isFavorited: false, favoriteCount: 44,)
//     ],
//   ),
// );
// Widget buttomSection = Container(
//   padding: const EdgeInsets.all(8),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8),
//             child: const Icon(Icons.comment, color:  Colors.blue),
//           ),
//           const Text("comment", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.blue),)
//         ],
//       ),
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8),
//             child: const Icon(Icons.share, color:  Colors.blue),
//           ),
//           const Text("comment", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.blue),)
//         ],
//       )
//       // _buildButtomColumn(Colors.blue, Icons.comment, "Comment"),
//       // _buildButtomColumn(Colors.blue, Icons.share, "share")
//     ],
//   ),
// );
// Widget descriptionSection = Container(
//   padding: const EdgeInsets.all(32),
//   child: const Text(
//     "Préparer une pizza de A à Z demande beaucoup de temps, mais le gout de la pizza maison en vaut largement la peine. Préparez séparément la pâte, la sauce et la garniture. Une fois que tous ces éléments sont prêts, assemblez le tout et faites cuire votre pizza à température élevée, jusqu'à ce qu'elle soit délicieusement croustillante. ",
//     softWrap: true,
//   ),
// );
//

// const ReceipeScreen({Key key, required this.receipe}) : super(key: key);
// final Receipe receipe;
// ReceipeScreen({super.key, required this.receipe});