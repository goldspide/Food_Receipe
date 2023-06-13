import 'package:flutter/material.dart';
import 'package:food_receipe/insert.dart';

class formulaire extends StatelessWidget {
  const formulaire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text("Crud Food"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (
                        _,
                        __,
                        ___,
                        ) =>
                    const  CreateFood()),
                // MaterialPageRoute(builder: (__){return ProfileScreen();}),
              );
            }, child: const Text("Create", style: TextStyle(),)),
            ElevatedButton(onPressed: () {}, child: const Text("Read")),
            ElevatedButton(onPressed: () {}, child: const Text("Update")),
            ElevatedButton(onPressed: () {}, child: const Text("Delete"))
          ],
        ),
      ),
    );
  }
}
