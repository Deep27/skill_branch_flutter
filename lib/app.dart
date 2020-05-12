import 'dart:math';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpinningTextViewExample(),
    );
  }
}

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({Key key, AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) => Transform.rotate(
        angle: _progress.value * 2 * pi,
        child: Container(
          color: Colors.blue,
          child: Text(
            'SkillBranch',
            style: TextStyle(fontSize: 32),
          ),
        ),
      );
}

class SpinningTextViewExample extends StatefulWidget {
  @override
  _SpinningTextViewExampleState createState() =>
      _SpinningTextViewExampleState();
}

class _SpinningTextViewExampleState extends State<SpinningTextViewExample>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Animated Text'),
      ),
      body: Center(
        child: SpinningContainer(
          controller: _controller,
        ),
      ),
    );
  }
}

class FirstExplicitAnimation extends StatefulWidget {
  @override
  _FirstExplicitAnimationState createState() => _FirstExplicitAnimationState();
}

class _FirstExplicitAnimationState extends State<FirstExplicitAnimation>
    with TickerProviderStateMixin {
  AnimationController _loopingAnimationLong;
  Animatable<double> _scaleCurveSlow;

  @override
  void initState() {
    super.initState();
    _scaleCurveSlow = Tween(begin: 0, end: 1000);

    _loopingAnimationLong = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _loopingAnimationLong.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _loopingAnimationLong.forward();
        }
      })
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RotationTransition(
              turns: _loopingAnimationLong.drive(_scaleCurveSlow),
              child: Icon(
                Icons.home,
                color: Colors.red,
                size: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCurve extends Curve {
  final double count;

  MyCurve({this.count = 1});

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * .5 + .5;
  }
}

class TwinAnimation extends StatefulWidget {
  @override
  _TwinAnimationState createState() => _TwinAnimationState();
}

class _TwinAnimationState extends State<TwinAnimation> {
  double newVal = 0;

//  use tween as field if possible
//  static final tween = Tween<double>(begin: 0, end: 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: newVal),
                duration: Duration(seconds: 2),
                builder: (_, double radius, __) {
                  print(radius);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(radius * 300),
                    child:
                        Container(color: Colors.red, width: 300, height: 300),
                  );
                }),
            Slider.adaptive(
                value: newVal,
                onChanged: (double val) {
                  setState(() {
                    newVal = val;
                  });
                })
          ],
        ),
      ),
    );
  }
}

class SimpleAnimation extends StatefulWidget {
  @override
  _SimpleAnimationState createState() => _SimpleAnimationState();
}

class _SimpleAnimationState extends State<SimpleAnimation> {
  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            width: isBig ? 500 : 100,
            height: isBig ? 500 : 100,
            child: FlutterLogo(),
          ),
          OutlineButton(
            child: Text('Click me'),
            color: Colors.white,
            onPressed: () {
              setState(() {
                isBig = !isBig;
              });
            },
          ),
        ],
      ),
    );
  }
}
