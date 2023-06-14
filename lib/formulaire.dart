import 'package:flutter/material.dart';
import 'package:food_receipe/fetch.dart';
import 'package:food_receipe/insert.dart';
import 'package:food_receipe/update.dart';

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
        margin: const EdgeInsets.only(top: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
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
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(0.7),
                      side: const BorderSide(color: Colors.black),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      "Create",
                      style: TextStyle(),
                    )),
                 const SizedBox( width: 30,),
                ElevatedButton(
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
                        // MaterialPageRoute(builder: (__){return ProfileScreen();}),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(0.7),
                      side: const BorderSide(color: Colors.black),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Read")),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
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
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(0.7),
                      side: const BorderSide(color: Colors.black),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Update")),
                const SizedBox( width: 30,),
                ElevatedButton(
                    onPressed: () {
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
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(0.7),
                      side: const BorderSide(color: Colors.black),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Delete"))
              ],
            ),

          ],
        ),
      ),
    );
  }
}
