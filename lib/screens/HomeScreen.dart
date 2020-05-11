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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Custom widgets'),
      ),
      body: ListView(
        children: <Widget>[
          ...mentorRepo.map((m) => MentorListItem(m)).toList()
        ],
      ),
    );
  }
}
