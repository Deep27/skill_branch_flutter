import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/screens/feed_screen.dart';
import 'package:FlutterGalleryApp/widgets/photo.dart';
import 'package:FlutterGalleryApp/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String _name;
  final String _userName;
  final String _altDescription;

  FullScreenImage(
      {String name, String userName, String altDescription, Key key})
      : _name = name,
        _userName = userName == null ? 'Unknown' : userName,
        _altDescription =
            altDescription == null ? 'No description' : altDescription,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Photo(photoLink: kFlutterDash),
          _PhotoDescription(_altDescription),
          _Author(),
          _Actions(),
        ],
      ),
    );
  }
}

class _PhotoDescription extends StatelessWidget {
  final String _description;

  _PhotoDescription(this._description);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(_description),
    );
  }
}

class _Author extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: <Widget>[
          UserAvatar('https://skill-branch.ru/img/speakers/Adechenko.jpg'),
          SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Kirill Adeshchenko', style: AppStyles.h2Black),
              Text('@kaparray',
                  style: AppStyles.h5Black.copyWith(color: AppColors.manatee)),
            ],
          ),
        ],
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _LikeButton(),
          SizedBox(width: 10),
          _Button('Save'),
          SizedBox(width: 10),
          _Button('Visit'),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String _text;
  final Function _onTap;

  _Button._(this._text, this._onTap);

  factory _Button(String text, {Function onTap}) {
    return _Button._(
        text, onTap == null ? () => print('$text button tapped') : onTap);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onTap(),
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(_text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              )),
        ),
      ),
    );
  }
}

class _LikeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
