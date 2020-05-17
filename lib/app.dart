import 'dart:math';

import 'package:FlutterGalleryApp/screens/feed_screen.dart';
import 'package:FlutterGalleryApp/screens/home.dart';
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
      home: Home(),
    );
  }
}

//class StaggerAnimation extends StatelessWidget {
//  final Animation<double> controller;
//  final Animation<double> opacity;
//  final Animation<double> width;
//  final Animation<double> height;
//  final Animation<EdgeInsets> padding;
//  final Animation<BorderRadius> borderRadius;
//  final Animation<Color> color;
//  final Animation<double> textOpacity;
//
//  StaggerAnimation({Key key, this.controller})
//      :
//        // Each animation defined here transforms its value during the subset
//        // of the controller's duration defined by the animation's interval.
//        // For example the opacity animation transforms its value during
//        // the first 10% of the controller's duration.
//        opacity = Tween<double>(
//          begin: 0,
//          end: 1,
//        ).animate(
//          CurvedAnimation(
//            parent: controller,
//            curve: Interval(
//              0,
//              0.1,
//              curve: Curves.ease,
//            ),
//          ),
//        ),
//        width = Tween<double>(
//          begin: 50,
//          end: 150,
//        ).animate(
//          CurvedAnimation(
//            parent: controller,
//            curve: Interval(
//              0.125,
//              0.250,
//              curve: Curves.ease,
//            ),
//          ),
//        ),
//        height = Tween<double>(begin: 50, end: 150).animate(
//          CurvedAnimation(
//            parent: controller,
//            curve: Interval(
//              0.25,
//              0.375,
//              curve: Curves.ease,
//            ),
//          ),
//        ),
//        padding = EdgeInsetsTween(
//          begin: const EdgeInsets.only(bottom: 16),
//          end: const EdgeInsets.only(bottom: 75),
//        ).animate(
//          CurvedAnimation(
//            parent: controller,
//            curve: Interval(
//              0.25,
//              0.375,
//              curve: Curves.ease,
//            ),
//          ),
//        ),
//        borderRadius = BorderRadiusTween(
//          begin: BorderRadius.circular(4),
//          end: BorderRadius.circular(75),
//        ).animate(CurvedAnimation(
//          parent: controller,
//          curve: Interval(
//            0.375,
//            0.5,
//            curve: Curves.ease,
//          ),
//        )),
//        color = ColorTween(
//          begin: Colors.indigo[100],
//          end: Colors.white.withOpacity(0.3),
//        ).animate(
//          CurvedAnimation(
//            parent: controller,
//            curve: Interval(
//              0.5,
//              0.75,
//              curve: Curves.ease,
//            ),
//          ),
//        ),
//        textOpacity = Tween<double>(
//          begin: 0,
//          end: 1,
//        ).animate(
//          CurvedAnimation(
//            parent: controller,
//            curve: Interval(
//              0.75,
//              1.0,
//              curve: Curves.ease,
//            ),
//          ),
//        ),
//        super(key: key);
//
//  // This function is called each time the controller "ticks" a new frame.
//  // When it runs, all of the animation's values will have been
//  // updated to reflect the controller's current value.
//  Widget _buildAnimation(BuildContext context, Widget child) {
//    return Container(
//      padding: padding.value,
//      alignment: Alignment.bottomCenter,
//      child: Opacity(
//        opacity: opacity.value,
//        child: Container(
//          width: width.value,
//          height: height.value,
//          decoration: BoxDecoration(
//            color: color.value,
//            border: Border.all(
//              color: Colors.indigo[300],
//              width: 3,
//            ),
//            borderRadius: borderRadius.value,
//          ),
//          child: Opacity(
//            opacity: textOpacity.value,
//            child: Center(
//              child: Padding(
//                padding: EdgeInsets.all(4),
//                child: Image.network(
//                    'https://skill-branch.ru/_nuxt/img/084fb5f.svg'),
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return AnimatedBuilder(
//      builder: _buildAnimation,
//      animation: controller,
//    );
//  }
//}
//
//class StaggeredAnimationExample extends StatefulWidget {
//  @override
//  _StaggeredAnimationExampleState createState() =>
//      _StaggeredAnimationExampleState();
//}
//
//class _StaggeredAnimationExampleState extends State<StaggeredAnimationExample>
//    with TickerProviderStateMixin {
//  AnimationController _controller;
//
//  @override
//  void initState() {
//    _controller = AnimationController(
//        duration: const Duration(milliseconds: 2000), vsync: this);
//  }
//
//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//
//  Future<void> _playAnimation() async {
//    try {
//      await _controller.forward().orCancel;
//      await _controller.reverse().orCancel;
//    } on TickerCanceled {
//      // the animation got canceled, probably because we were disposed
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
////    timeDilation = 10; // 1 is normal animation speed
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text('Staggered Animation'),
//      ),
//      body: GestureDetector(
//        behavior: HitTestBehavior.opaque,
//        onTap: () {
//          _playAnimation();
//        },
//        child: Center(
//          child: Container(
//            width: 300,
//            height: 300,
//            decoration: BoxDecoration(
//              color: Colors.black.withOpacity(0.1),
//              border: Border.all(
//                color: Colors.black.withOpacity(0.5),
//              ),
//            ),
//            child: StaggerAnimation(controller: _controller.view),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class SpinningContainer extends AnimatedWidget {
//  const SpinningContainer({Key key, AnimationController controller})
//      : super(key: key, listenable: controller);
//
//  Animation<double> get _progress => listenable;
//
//  @override
//  Widget build(BuildContext context) => Transform.rotate(
//        angle: _progress.value * 2 * pi,
//        child: Container(
//          color: Colors.blue,
//          child: Text(
//            'SkillBranch',
//            style: TextStyle(fontSize: 32),
//          ),
//        ),
//      );
//}
//
//class SpinningTextViewExample extends StatefulWidget {
//  @override
//  _SpinningTextViewExampleState createState() =>
//      _SpinningTextViewExampleState();
//}
//
//class _SpinningTextViewExampleState extends State<SpinningTextViewExample>
//    with TickerProviderStateMixin {
//  AnimationController _controller;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = AnimationController(
//      duration: const Duration(seconds: 1),
//      vsync: this,
//    )..repeat();
//  }
//
//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        title: const Text('Animated Text'),
//      ),
//      body: Center(
//        child: SpinningContainer(
//          controller: _controller,
//        ),
//      ),
//    );
//  }
//}
//
//class FirstExplicitAnimation extends StatefulWidget {
//  @override
//  _FirstExplicitAnimationState createState() => _FirstExplicitAnimationState();
//}
//
//class _FirstExplicitAnimationState extends State<FirstExplicitAnimation>
//    with TickerProviderStateMixin {
//  AnimationController _loopingAnimationLong;
//  Animatable<double> _scaleCurveSlow;
//
//  @override
//  void initState() {
//    super.initState();
//    _scaleCurveSlow = Tween(begin: 0, end: 1000);
//
//    _loopingAnimationLong = AnimationController(
//      duration: const Duration(seconds: 30),
//      vsync: this,
//    )
//      ..addStatusListener((status) {
//        if (status == AnimationStatus.completed) {
//          _loopingAnimationLong.reverse();
//        } else if (status == AnimationStatus.dismissed) {
//          _loopingAnimationLong.forward();
//        }
//      })
//      ..forward();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
//          children: <Widget>[
//            RotationTransition(
//              turns: _loopingAnimationLong.drive(_scaleCurveSlow),
//              child: Icon(
//                Icons.home,
//                color: Colors.red,
//                size: 200,
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class MyCurve extends Curve {
//  final double count;
//
//  MyCurve({this.count = 1});
//
//  @override
//  double transformInternal(double t) {
//    return sin(count * 2 * pi * t) * .5 + .5;
//  }
//}
//
//class TwinAnimation extends StatefulWidget {
//  @override
//  _TwinAnimationState createState() => _TwinAnimationState();
//}
//
//class _TwinAnimationState extends State<TwinAnimation> {
//  double newVal = 0;
//
////  use tween as field if possible
////  static final tween = Tween<double>(begin: 0, end: 100);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
//          children: <Widget>[
//            TweenAnimationBuilder(
//                tween: Tween<double>(begin: 0, end: newVal),
//                duration: Duration(seconds: 2),
//                builder: (_, double radius, __) {
//                  print(radius);
//                  return ClipRRect(
//                    borderRadius: BorderRadius.circular(radius * 300),
//                    child:
//                        Container(color: Colors.red, width: 300, height: 300),
//                  );
//                }),
//            Slider.adaptive(
//                value: newVal,
//                onChanged: (double val) {
//                  setState(() {
//                    newVal = val;
//                  });
//                })
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class SimpleAnimation extends StatefulWidget {
//  @override
//  _SimpleAnimationState createState() => _SimpleAnimationState();
//}
//
//class _SimpleAnimationState extends State<SimpleAnimation> {
//  bool isBig = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(),
//      body: Column(
//        children: <Widget>[
//          AnimatedContainer(
//            duration: Duration(milliseconds: 100),
//            width: isBig ? 500 : 100,
//            height: isBig ? 500 : 100,
//            child: FlutterLogo(),
//          ),
//          OutlineButton(
//            child: Text('Click me'),
//            color: Colors.white,
//            onPressed: () {
//              setState(() {
//                isBig = !isBig;
//              });
//            },
//          ),
//        ],
//      ),
//    );
//  }
//}
