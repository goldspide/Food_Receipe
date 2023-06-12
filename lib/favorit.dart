import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  final bool isFavorited;
  final int favoriteCount;
  const FavoriteWidget({Key? key, required this.favoriteCount,required this.isFavorited}) : super(key: key);

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState(this.isFavorited,this.favoriteCount);
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 41;

  _FavoriteWidgetState(this._isFavorited, this._favoriteCount);
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _toggleFavorite,
          icon:
              _isFavorited ?Icon(Icons.favorite) : Icon(Icons.favorite_border),
          color: Colors.red,
        ),
        Text("$_favoriteCount")
      ],
    );
  }
}
