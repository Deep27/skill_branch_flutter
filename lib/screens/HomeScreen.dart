import 'package:FlutterGalleryApp/painter/smile_painter.dart';
import 'package:FlutterGalleryApp/res/mentor_repo.dart';
import 'package:FlutterGalleryApp/widgets/mentor_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom widgets'),
      ),
      body: Center(
        child: CustomPaint(
          painter: SmilePainter(),
          size: Size(300, 300),
        ),
      ),
    );
  }
}
