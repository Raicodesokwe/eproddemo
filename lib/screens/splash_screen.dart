import 'dart:async';
import 'dart:math' as math;
import 'package:eproddemo/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  splashScreenTimer() {
    Timer(const Duration(milliseconds: 5100), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreenTimer();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(_animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _animationController.forward();
            }
          });
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.greenColor,
        body: Center(
          child: Transform.rotate(
            angle: _animation.value,
            child: SizedBox(
                height: 150,
                width: 150,
                child: SvgPicture.asset('assets/images/eprodlogo.svg')),
          ),
        ),
      ),
    );
  }
}
