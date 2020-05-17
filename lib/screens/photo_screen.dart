import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/screens/feed_screen.dart';
import 'package:FlutterGalleryApp/widgets/photo.dart';
import 'package:FlutterGalleryApp/widgets/user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String _name;
  final String _userName;
  final String _altDescription;
  final String _heroTag;
  final String _photo;
  final String _userPhoto;

  FullScreenImage(
      {String name,
        String userName,
        String altDescription,
        String heroTag,
        String photo,
        String userPhoto,
        Key key})
      : _name = name == null ? 'Kirill Adeshchenko' : name,
        _userName = userName == null ? 'kaparray' : userName,
        _altDescription =
        altDescription == null ? _generateDescription() : altDescription,
        _heroTag = heroTag == null ? "" : heroTag,
        _photo = photo == null ? kFlutterDash : photo,
        _userPhoto = userPhoto == null
            ? 'https://skill-branch.ru/img/speakers/Adechenko.jpg'
            : userPhoto,
        super(key: key);

  static String _generateDescription() {
    StringBuffer sb = StringBuffer();
    for (var i = 0; i < 100; i++) {
      sb.write("A very long long description. ");
    }
    return sb.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo'),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: _heroTag,
            child: Photo(photoLink: _photo),
          ),
          _PhotoDescription(_altDescription),
          _AuthorInfo(_name, _userName, _userPhoto),
          _Actions(),
        ],
      ),
    );
  }
}

class _AuthorInfoStaggeredAnimation extends StatelessWidget {
  _AuthorInfoStaggeredAnimation(
      {Key key, this.controller, this.name, this.userName, this.userPhoto})
      : avatarOpacity = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        0,
        0.5,
        curve: Curves.ease,
      ),
    ),
  ),
        userInfoOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.5,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final String userName;
  final String name;
  final String userPhoto;
  final AnimationController controller;
  final Animation<double> avatarOpacity;
  final Animation<double> userInfoOpacity;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Row(
            children: <Widget>[
              Opacity(
                opacity: avatarOpacity.value,
                child: UserAvatar(userPhoto),
              ),
              SizedBox(width: 6),
              Opacity(
                opacity: userInfoOpacity.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(name, style: AppStyles.h2Black),
                    Text(
                      userName,
                      style:
                      AppStyles.h5Black.copyWith(color: AppColors.manatee),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class _AuthorInfo extends StatefulWidget {
  final String _userPhoto;
  final String _name;
  final String _userName;

  _AuthorInfo(String name, String userName, String userPhoto, {Key key})
      : _name = name,
        _userName = '@$userName',
        _userPhoto = userPhoto,
        super(key: key);

  @override
  __AuthorInfoState createState() => __AuthorInfoState();
}

class __AuthorInfoState extends State<_AuthorInfo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      _controller.forward().orCancel;
    } on TickerCanceled {
      print('Ticker canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
    _AuthorInfoStaggeredAnimation animatedAuthorInfo =
    _AuthorInfoStaggeredAnimation(
        controller: _controller,
        name: widget._name,
        userName: widget._userName,
        userPhoto: widget._userPhoto);
    _playAnimation();
    return animatedAuthorInfo;
  }
}

class _PhotoDescription extends StatelessWidget {
  final String _description;

  _PhotoDescription(this._description);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        _description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: AppStyles.h3,
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
