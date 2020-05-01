import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String _name;
  final String _userName;
  final String _altDescription;

  FullScreenImage(
      {String name, String userName, String altDescription, Key key})
      : _name = name,
        _userName = userName,
        _altDescription = altDescription,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
