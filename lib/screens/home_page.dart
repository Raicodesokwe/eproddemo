import 'dart:async';

import 'package:eproddemo/models/quick_actions_model.dart';
import 'package:eproddemo/screens/scan_page.dart';
import 'package:eproddemo/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/extra_items_model.dart';
import '../widgets/coming_soon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController _pageController = PageController();
  int _currentPage = 0;
  List<String> _images = [
    'assets/images/fertilizerbag.svg',
    'assets/images/farmloan.svg',
  ];
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);
    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );
    scaleAnimation =
        CurvedAnimation(parent: scaleController, curve: Curves.elasticInOut);
    Future.delayed(Duration(milliseconds: 600), () {
      controller.forward().then((value) => scaleController.forward());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    scaleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: FadeTransition(
          opacity: fadeAnimation,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: size.height * 0.15,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            SizedBox(
                                height: 50,
                                width: 50,
                                child: SvgPicture.asset(
                                    'assets/images/eprodlogo.svg')),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Welcome, Erick',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Spacer(),
                            Container(
                              height: 30,
                              width: 30,
                              child: Center(
                                child: Icon(
                                  FontAwesomeIcons.solidBell,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white30),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(color: AppColor.greenColor),
                    ),
                    Positioned(
                        bottom: -80,
                        left: size.width * 0.1,
                        child: ScaleTransition(
                          scale: scaleAnimation,
                          child: Container(
                            width: size.width * 0.8,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Manage Account',
                                        style: TextStyle(
                                            color: AppColor.greenColor),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.arrowRight,
                                        color: AppColor.greenColor,
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '70k',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              'ksh',
                                              style: TextStyle(
                                                  color: AppColor.greenColor),
                                            ),
                                            Text(
                                              'inputs',
                                              style: TextStyle(
                                                  fontSize: size.width * 0.029),
                                            )
                                          ],
                                        ),
                                        VerticalDivider(),
                                        Column(
                                          children: [
                                            Text(
                                              '3',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              'months',
                                              style: TextStyle(
                                                  color: AppColor.greenColor),
                                            ),
                                            Text(
                                              'to the planting season',
                                              style: TextStyle(
                                                  fontSize: size.width * 0.029),
                                            )
                                          ],
                                        ),
                                        VerticalDivider(),
                                        Column(
                                          children: [
                                            Text(
                                              '300k',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              'ksh',
                                              style: TextStyle(
                                                  color: AppColor.greenColor),
                                            ),
                                            Text(
                                              'Total farm sales',
                                              style: TextStyle(
                                                  fontSize: size.width * 0.029),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(3, 5),
                                      blurRadius: 5,
                                      color: Colors.black26)
                                ],
                                color: Color(0xFFF7EADA),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: size.height * 0.13,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Quick Actions',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Wrap(
                          spacing: 15,
                          children: List.generate(
                              quickActionsList.length,
                              (index) => GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) {
                                            return ComingSoon(size: size);
                                          });
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: Center(
                                            child: SizedBox(
                                              height: 30,
                                              width: 30,
                                              child:
                                                  quickActionsList[index].icon,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.greenColor
                                                .withOpacity(0.2),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          quickActionsList[index].label,
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ))),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Information panel',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: size.height * 0.23,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return SvgPicture.asset(
                          _images[index],
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  spacing: size.width * 0.05,
                  runSpacing: size.height * 0.015,
                  children: List.generate(
                      extraItemsList.length,
                      (index) => GestureDetector(
                            onTap: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ScanPage()));
                            },
                            child: Container(
                                height: size.height * 0.15,
                                width: size.width * 0.4,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(3, 5),
                                          blurRadius: 5,
                                          color: Colors.black26)
                                    ],
                                    color: AppColor.brownColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: extraItemsList[index].icon),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                        width: size.width * 0.3,
                                        child: Center(
                                            child: Text(
                                                extraItemsList[index].label)))
                                  ],
                                )),
                          )),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
