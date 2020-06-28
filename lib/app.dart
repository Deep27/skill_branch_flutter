import 'dart:async';
import 'dart:io' show Platform;

import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/screens/home.dart';
import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final Stream<ConnectivityResult> connectivity =
      Connectivity().onConnectivityChanged;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: buildAppTextTheme(),
      ),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/fullScreenImage') {
          FullScreenImageArguments args =
              settings.arguments as FullScreenImageArguments;
          final route = FullScreenImage(
            name: args.name,
            userName: args.userName,
            altDescription: args.altDescription,
            heroTag: args.heroTag,
            photo: args.photo,
            userPhoto: args.userPhoto,
            key: key,
          );

          if (Platform.isAndroid) {
            return MaterialPageRoute(
              builder: (ctx) => route,
              settings: args.routeSettings,
            );
          } else if (Platform.isIOS) {
            return CupertinoPageRoute(
              builder: (ctx) => route,
              settings: args.routeSettings,
            );
          }
        }
        return null;
      },
      home: Home(connectivity),
    );
  }
}
