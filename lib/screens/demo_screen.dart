import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.pop(context, {'name': 'Term'});
          },
          child: const Text('Click me'),
        ),
      ),
    );
  }
}
