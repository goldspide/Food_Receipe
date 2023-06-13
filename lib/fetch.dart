import 'package:flutter/material.dart';

import 'Api.dart';

class FecthData extends StatelessWidget {
  const FecthData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: FutureBuilder(
      //
      //   future: Api.getfood(),
      //     builder: (BuildContext context, AsyncSnapshot snapshot)
      // ),
    );
  }
}
