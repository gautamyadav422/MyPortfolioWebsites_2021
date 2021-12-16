import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailto/mailto.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Constant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;
  final List<String> imgList = [
    'assets/images/gautamweb.png',
    'assets/images/a1.jpeg',
    'assets/images/a2.jpeg',
    'assets/images/a3.jpeg',
  ];
  final List<String> imgListformobile = [
    'assets/images/MOBILE SCREEN.png',
    'assets/images/elect final.png',
    'assets/images/naamkaran final.png',
    'assets/images/online kaka final file.png',
  ];

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  launchMailto() async {
    final mailtoLink =
        Mailto(to: ['gautamyadav422@gmail.com'], body: "Hello Gautam");
    // Convert the Mailto instance into a string.
    // Use either Dart's string interpolation
    // or the toString() method.
    await launch('$mailtoLink');
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    Size size = MediaQuery.of(context).size;

    _opacity = _scrollPosition < size.height * 0.40
        ? _scrollPosition / (size.height * 0.40)
        : 1;

    return SafeArea(
      child : Scaffold(
          backgroundColor: black,
          body: Column(
            children: [
              navBar(size, _opacity),
              Expanded(
                child: ListView(
                  controller: _scrollController,
                  children: [
                    ResponsiveVisibility(
                      child: headerSection(size),
                      visible: false,
                      visibleWhen: [Condition.largerThan(name: MOBILE)],
                    ),
                    ResponsiveVisibility(
                      child: headerSectionforMobile(size),
                      visible: false,
                      visibleWhen: [
                        Condition.smallerThan(name: MOBILE),
                        Condition.equals(name: MOBILE)
                      ],
                    ),
                    ResponsiveVisibility(
                      child: aboutSection(size),
                      visible: false,
                      visibleWhen: [Condition.largerThan(name: MOBILE)],
                    ),
                    ResponsiveVisibility(
                      child: aboutSectionforMobile(size),
                      visible: false,
                      visibleWhen: [
                        Condition.smallerThan(name: MOBILE),
                        Condition.equals(name: MOBILE)
                      ],
                    ),
                    ResponsiveVisibility(
                      child: projectSection(size),
                      visible: false,
                      visibleWhen: [Condition.largerThan(name: MOBILE)],
                    ),
                    ResponsiveVisibility(
                      child: projectSectionforMobile(size),
                      visible: false,
                      visibleWhen: [
                        Condition.smallerThan(name: MOBILE),
                        Condition.equals(name: MOBILE)
                      ],
                    ),
                    ResponsiveVisibility(
                      child: contactSection(size),
                      visible: false,
                      visibleWhen: [Condition.largerThan(name: MOBILE)],
                    ),
                    ResponsiveVisibility(
                      child: contactSectionforMobile(size),
                      visible: false,
                      visibleWhen: [
                        Condition.smallerThan(name: MOBILE),
                        Condition.equals(name: MOBILE)
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget navBar(Size size, double opacity) {
    return Container(
      color: red,
      height: size.height * 0.1,
      child: Container(
        margin: size.width <= 800
            ? EdgeInsets.symmetric(horizontal: 50)
            : EdgeInsets.symmetric(horizontal: 100),
        child: Row(
          children: [
            TweenAnimationBuilder(
              child: Row(
                children: [
                  Text(
                    'Gautam Yadav',
                    style: GoogleFonts.ubuntu(
                        color: white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    ' Portfolio.',
                    style: GoogleFonts.ubuntu(
                        color: _opacity == 0 ? red : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
              duration: Duration(milliseconds: 500),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (BuildContext context, double position, Widget child) {
                return Opacity(
                  opacity: position,
                  child: child,
                );
              },
            ),

          ],
        ),
      ),
    );
  }

  Widget headerSection(Size size) {
    return Container(
      height: size.height * 0.9,
      color: black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: size.width <= 800
                  ? EdgeInsets.only(left: 50)
                  : EdgeInsets.only(left: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: TweenAnimationBuilder(
                              child: Text("Hay! There",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil().setSp(22,
                                              allowFontScalingSelf: true),
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none))),
                              duration: Duration(milliseconds: 3000),
                              curve: Interval(0, 0.2, curve: Curves.easeIn),
                              tween: Tween<double>(begin: 0, end: 1),
                              builder: (BuildContext context, double position,
                                  Widget child) {
                                return Opacity(
                                  opacity: position,
                                  child: child,
                                );
                              },
                            ),
                          ),
                          Container(
                            child: TweenAnimationBuilder(
                              child: Text("I AM Gautam",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil().setSp(55,
                                              allowFontScalingSelf: true),
                                          fontWeight: FontWeight.w800,
                                          decoration: TextDecoration.none))),
                              duration: Duration(milliseconds: 3000),
                              curve: Interval(0.2, 0.4, curve: Curves.easeIn),
                              tween: Tween<double>(begin: 0, end: 1),
                              builder: (BuildContext context, double position,
                                  Widget child) {
                                return Opacity(
                                  opacity: position,
                                  child: child,
                                );
                              },
                            ),
                          ),
                          Container(
                            child: TweenAnimationBuilder(
                              child: Row(
                                children: [
                                  Text("A Professional",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil().setSp(25,
                                                  allowFontScalingSelf: true),
                                              fontWeight: FontWeight.w800,
                                              decoration:
                                                  TextDecoration.none))),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  TyperAnimatedTextKit(
                                      speed: Duration(milliseconds: 100),
                                      text: [
                                        'Android Developer',
                                        'Flutter Developer',
                                        'Ui Designer',
                                        'Freelancer',
                                      ],
                                      textStyle: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  112, 11, 29, 1),
                                              fontSize: ScreenUtil().setSp(25,
                                                  allowFontScalingSelf: true),
                                              fontWeight: FontWeight.w800,
                                              decoration:
                                                  TextDecoration.none))),
                                ],
                              ),
                              duration: Duration(milliseconds: 3000),
                              curve: Interval(0.4, 0.8, curve: Curves.easeIn),
                              tween: Tween<double>(begin: 0, end: 1),
                              builder: (BuildContext context, double position,
                                  Widget child) {
                                return Opacity(
                                  opacity: position,
                                  child: child,
                                );
                              },
                            ),
                          ),
                          Container(
                            child: TweenAnimationBuilder(
                              child: GestureDetector(
                                onTap: () {
                                  launchMailto();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                      gradient: LinearGradient(colors: [
                                        Colors.black,
                                        Color.fromRGBO(112, 11, 29, 1)
                                      ])),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0,
                                        top: 15,
                                        bottom: 15,
                                        right: 40),
                                    child: Text("CONTACT ME",
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(15,
                                                    allowFontScalingSelf: true),
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.none))),
                                  ),
                                ),
                              ),
                              duration: Duration(milliseconds: 3000),
                              curve: Interval(0.8, 0.9, curve: Curves.easeIn),
                              tween: Tween<double>(begin: 0, end: 1),
                              builder: (BuildContext context, double position,
                                  Widget child) {
                                return Opacity(
                                  opacity: position,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: child,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TweenAnimationBuilder(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 40),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              launchMailto();
                            },
                            child: Image(
                              width: 25,
                              height: 25,
                              image: AssetImage('assets/images/google.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: GestureDetector(
                              onTap: () {
                                _launchURL(
                                    "https://www.linkedin.com/in/gautam-yadav-598640ab/");
                              },
                              child: Image(
                                width: 25,
                                height: 25,
                                image: AssetImage("assets/images/linkedin.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: GestureDetector(
                              onTap: () {
                                _launchURL("https://github.com/gautamyadav422");
                              },
                              child: Image(
                                width: 25,
                                height: 25,
                                image: AssetImage("assets/images/git.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: GestureDetector(
                              onTap: () {
                                _launchURL(
                                    "https://www.instagram.com/flutterdevtech/");
                              },
                              child: Image(
                                width: 25,
                                height: 25,
                                image: AssetImage(
                                    "assets/images/instagramwhite.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    duration: Duration(milliseconds: 3000),
                    curve: Interval(0.9, 0.99, curve: Curves.easeIn),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder:
                        (BuildContext context, double position, Widget child) {
                      return Opacity(
                        opacity: position,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: child,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: size.width <= 800
                  ? EdgeInsets.only(left: 10)
                  : EdgeInsets.only(left: 60),
              child: TweenAnimationBuilder(
                duration: Duration(milliseconds: 3000),
                child: Image(
                  image: AssetImage("assets/images/gautamme.png"),
                  fit: BoxFit.contain,
                ),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (BuildContext context, double position, Widget child) {
                  return Opacity(
                    opacity: position,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20, right: position * 20),
                      child: child,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  headerSectionforMobile(Size size) {
    return Container(
      height: size.height * 0.9,
      color: black,
      child: Container(
        margin: size.width <= 800
            ? EdgeInsets.symmetric(horizontal: 50)
            : EdgeInsets.symmetric(horizontal: 100),
        child: Stack(
          children: [
            Center(
              child: TweenAnimationBuilder(
                duration: Duration(milliseconds: 3000),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image(
                    image: AssetImage("assets/images/gautamme.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (BuildContext context, double position, Widget child) {
                  return Opacity(
                    opacity: position,
                    child: child,
                  );
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: TweenAnimationBuilder(
                            child: Text("Hay! There",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(50,
                                            allowFontScalingSelf: true),
                                        letterSpacing: 3,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none))),
                            duration: Duration(milliseconds: 3000),
                            curve: Interval(0, 0.2, curve: Curves.easeIn),
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (BuildContext context, double position,
                                Widget child) {
                              return Opacity(
                                opacity: position,
                                child: child,
                              );
                            },
                          ),
                        ),
                        Container(
                          child: TweenAnimationBuilder(
                            child: Text("I AM Gautam",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(85,
                                            allowFontScalingSelf: true),
                                        fontWeight: FontWeight.w800,
                                        decoration: TextDecoration.none))),
                            duration: Duration(milliseconds: 3000),
                            curve: Interval(0.2, 0.4, curve: Curves.easeIn),
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (BuildContext context, double position,
                                Widget child) {
                              return Opacity(
                                opacity: position,
                                child: child,
                              );
                            },
                          ),
                        ),
                        Container(
                          child: TweenAnimationBuilder(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("A Professional",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenUtil().setSp(50,
                                                allowFontScalingSelf: true),
                                            fontWeight: FontWeight.w800,
                                            decoration: TextDecoration.none))),
                                SizedBox(
                                  width: 5,
                                ),
                                TyperAnimatedTextKit(
                                    speed: Duration(milliseconds: 100),
                                    text: [
                                      'Android Developer',
                                      'Flutter Developer',
                                      'Ui Designer',
                                      'Freelancer',
                                    ],
                                    textStyle: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color:
                                                Color.fromRGBO(112, 11, 29, 1),
                                            fontSize: ScreenUtil().setSp(50,
                                                allowFontScalingSelf: true),
                                            fontWeight: FontWeight.w800,
                                            decoration: TextDecoration.none))),
                              ],
                            ),
                            duration: Duration(milliseconds: 3000),
                            curve: Interval(0.4, 0.8, curve: Curves.easeIn),
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (BuildContext context, double position,
                                Widget child) {
                              return Opacity(
                                opacity: position,
                                child: child,
                              );
                            },
                          ),
                        ),
                        Container(
                          child: TweenAnimationBuilder(
                            child: GestureDetector(
                              onTap: () {
                                launchMailto();
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20, bottom: 60),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    border:
                                        Border.all(width: 1.0, color: white)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0,
                                      top: 10,
                                      bottom: 10,
                                      right: 10),
                                  child: Text("CONTACT ME",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil().setSp(35,
                                                  allowFontScalingSelf: true),
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.none))),
                                ),
                              ),
                            ),
                            duration: Duration(milliseconds: 3000),
                            curve: Interval(0.8, 0.9, curve: Curves.easeIn),
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (BuildContext context, double position,
                                Widget child) {
                              return Opacity(
                                opacity: position,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: child,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TweenAnimationBuilder(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            launchMailto();
                          },
                          child: Image(
                            width: 25,
                            height: 25,
                            image: AssetImage("assets/images/google.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: GestureDetector(
                            onTap: () {
                              _launchURL(
                                  "https://www.linkedin.com/in/gautam-yadav-598640ab/");
                            },
                            child: Image(
                              width: 25,
                              height: 25,
                              image: AssetImage("assets/images/linkedin.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: GestureDetector(
                            onTap: () {
                              _launchURL("https://github.com/gautamyadav422");
                            },
                            child: Image(
                              width: 25,
                              height: 25,
                              image: AssetImage("assets/images/git.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: GestureDetector(
                            onTap: () {
                              _launchURL(
                                  "https://www.instagram.com/flutterdevtech/");
                            },
                            child: Image(
                              width: 25,
                              height: 25,
                              image: AssetImage(
                                  "assets/images/instagramwhite.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  duration: Duration(milliseconds: 3000),
                  curve: Interval(0.9, 0.99, curve: Curves.easeIn),
                  tween: Tween<double>(begin: 0, end: 1),
                  builder:
                      (BuildContext context, double position, Widget child) {
                    return Opacity(
                      opacity: position,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: child,
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget aboutSection(Size size) {
    return Container(
      height: size.height * 0.9,
      color: Colors.white,
      child: Container(
        margin: size.width <= 800
            ? EdgeInsets.symmetric(horizontal: 50)
            : EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text("About Me",
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          color: black,
                          fontSize: ScreenUtil()
                              .setSp(32, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: Text("Who i am",
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          color: red,
                          fontSize: ScreenUtil()
                              .setSp(18, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none))),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Image(
                          image: AssetImage("assets/images/appdevloper.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("I'm",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color: black,
                                            fontSize: ScreenUtil().setSp(25,
                                                allowFontScalingSelf: true),
                                            fontWeight: FontWeight.w800,
                                            decoration: TextDecoration.none))),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Gautam H. Yadav.",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            color: red,
                                            fontSize: ScreenUtil().setSp(25,
                                                allowFontScalingSelf: true),
                                            fontWeight: FontWeight.w800,
                                            decoration: TextDecoration.none)))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text(
                                  "A hard-working, Detail-oriented, Professional and self-motivated Mobile Application Developer. Worked as an Application Developer with 2 years experience in continuously developing, implementing and adopting new technologies to maximize development efficiency and innovate applications. Skills involve design, develop, implement and enhance highly optimized cross-platform hybrid as well as native mobile apps and methods to meet both internal and external analysis requirements.",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: black,
                                          fontSize: ScreenUtil().setSp(14,
                                              allowFontScalingSelf: true),
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none))),
                            ),
                            GestureDetector(
                              onTap: () {
                                _launchURL(
                                    "https://drive.google.com/file/d/1AgIhTieTkrFcSbvmACXRweY5b-EUOdLO/view?usp=sharing");
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    gradient:
                                        LinearGradient(colors: [red, red])),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, top: 15, bottom: 15, right: 15),
                                  child: Text("Download CV",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil().setSp(15,
                                                  allowFontScalingSelf: true),
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.none))),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget aboutSectionforMobile(Size size) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text("About Me",
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          color: black,
                          fontSize: ScreenUtil()
                              .setSp(50, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text("Who i am",
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          color: red,
                          fontSize: ScreenUtil()
                              .setSp(30, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none))),
            ),
            Container(
              child: Image(
                image: AssetImage("assets/images/appdevloper.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("I'm",
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            color: black,
                            fontSize: ScreenUtil()
                                .setSp(45, allowFontScalingSelf: true),
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none))),
                SizedBox(
                  width: 5,
                ),
                Text("Gautam H. Yadav.",
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            color: red,
                            fontSize: ScreenUtil()
                                .setSp(45, allowFontScalingSelf: true),
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none)))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                "A hard-working, Detail-oriented, methodical professional and self-motivated Mobile Application Developer. Worked as an Application Developer with 2 years experience in continuously developing, implementing and adopting new technologies to maximize development efficiency and innovate applications. Skills involve design, develop, implement and enhance highly optimized cross-platform hybrid as well as native mobile apps and methods to meet both internal and external analysis requirements.",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: black,
                        fontSize:
                            ScreenUtil().setSp(30, allowFontScalingSelf: true),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none)),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                _launchURL(
                    "https://drive.google.com/file/d/1AgIhTieTkrFcSbvmACXRweY5b-EUOdLO/view?usp=sharing");
              },
              child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    gradient: LinearGradient(colors: [red, red])),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 15, bottom: 15, right: 15),
                  child: Text("Download CV",
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil()
                                  .setSp(30, allowFontScalingSelf: true),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget projectSection(Size size) {
    return Container(
        color: Colors.black,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text("Projects",
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            color: white,
                            fontSize: ScreenUtil()
                                .setSp(40, allowFontScalingSelf: true),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none))),
              ),
            ),
            Container(
                margin: size.width <= 800
                    ? EdgeInsets.symmetric(horizontal: 50)
                    : EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: size.height * 0.8,
                        child: CarouselSlider(
                          options: CarouselOptions(
                              height: size.height * 0.8,
                              viewportFraction: 1.0,
                              autoPlayCurve: Curves.linear,
                              enlargeCenterPage: true,
                              autoPlay: true
                              // autoPlay: false,
                              ),
                          items: imgList
                              .map((item) => Container(
                                    child: Center(
                                        child: Image(
                                      image: AssetImage(item),
                                      fit: BoxFit.fill,
                                      height: size.height * 0.8,
                                    )),
                                  ))
                              .toList(),
                        ),
                      ),
                    ])),
          ],
        ));
  }

  Widget projectSectionforMobile(Size size) {
    return Stack(
      children: [
        Container(
            color: Colors.black,
            child: Container(
                margin: size.width <= 800
                    ? EdgeInsets.symmetric(horizontal: 0)
                    : EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: size.height * 0.9,
                        child: CarouselSlider(
                          options: CarouselOptions(
                              height: size.height * 0.9,
                              viewportFraction: 1.0,
                              autoPlayCurve: Curves.linear,
                              enlargeCenterPage: true,
                              autoPlay: true
                              // autoPlay: false,
                              ),
                          items: imgListformobile
                              .map((item) => Container(
                                    child: Center(
                                        child: Image(
                                      image: AssetImage(item),
                                      fit: BoxFit.cover,
                                      height: size.height * 0.9,
                                    )),
                                  ))
                              .toList(),
                        ),
                      ),
                    ]))),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text("Projects",
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                        color: white,
                        fontSize:
                            ScreenUtil().setSp(60, allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none))),
          ),
        ),
      ],
    );
  }

  Widget contactSection(Size size) {
    return Container(
      height: size.height * 0.9,
      color: Colors.white,
      child: Container(
        margin: size.width <= 800
            ? EdgeInsets.symmetric(horizontal: 50)
            : EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                          margin: EdgeInsets.only(top: 20, right: 20),
                          child: Image(
                            image: AssetImage("assets/images/callme.png"),
                            fit: BoxFit.contain,
                          )),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Contact Me",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                        color: black,
                                        fontSize: ScreenUtil().setSp(45,
                                            allowFontScalingSelf: true),
                                        fontWeight: FontWeight.w800,
                                        decoration: TextDecoration.none))),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text("Let's work together. Say hello.",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          color: black,
                                          fontSize: ScreenUtil().setSp(25,
                                              allowFontScalingSelf: true),
                                          fontWeight: FontWeight.w800,
                                          decoration: TextDecoration.none))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text("Gautamyadav422@gmail.com",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: red,
                                          fontSize: ScreenUtil().setSp(30,
                                              allowFontScalingSelf: true),
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none))),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      launchMailto();
                                    },
                                    child: Image(
                                      width: 40,
                                      height: 40,
                                      image: AssetImage(
                                          "assets/images/gmailred.png"),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchURL(
                                            "https://www.linkedin.com/in/gautam-yadav-598640ab/");
                                      },
                                      child: Image(
                                        width: 40,
                                        height: 40,
                                        image: AssetImage(
                                            "assets/images/linkined.png"),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchURL(
                                            "https://github.com/gautamyadav422");
                                      },
                                      child: Image(
                                        width: 40,
                                        height: 40,
                                        image: AssetImage(
                                            "assets/images/gitred.png"),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchURL(
                                            "https://www.instagram.com/flutterdevtech/");
                                      },
                                      child: Image(
                                        width: 40,
                                        height: 40,
                                        image: AssetImage(
                                            "assets/images/instagramred.png"),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "DESIGNED AND DEVELOPED BY YOURS TRULY. Gautam Yadav",
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            color: black,
                            fontSize: ScreenUtil()
                                .setSp(12, allowFontScalingSelf: true),
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  contactSectionforMobile(Size size) {
    return Container(
      height: size.height * 0.9,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Image(
                    image: AssetImage("assets/images/callme.png"),
                    fit: BoxFit.fill,
                  )),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Contact Me",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                color: black,
                                fontSize: ScreenUtil()
                                    .setSp(85, allowFontScalingSelf: true),
                                fontWeight: FontWeight.w800,
                                decoration: TextDecoration.none))),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text("Let's work together. Say hello.",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  color: black,
                                  fontSize: ScreenUtil()
                                      .setSp(40, allowFontScalingSelf: true),
                                  fontWeight: FontWeight.w800,
                                  decoration: TextDecoration.none))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text("Gautamyadav422@gmail.com",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: red,
                                  fontSize: ScreenUtil()
                                      .setSp(50, allowFontScalingSelf: true),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none))),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              launchMailto();
                            },
                            child: Image(
                              width: 20,
                              height: 20,
                              image: AssetImage("assets/images/gmailred.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                _launchURL(
                                    "https://www.linkedin.com/in/gautam-yadav-598640ab/");
                              },
                              child: Image(
                                width: 20,
                                height: 20,
                                image: AssetImage("assets/images/linkined.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                _launchURL("https://github.com/gautamyadav422");
                              },
                              child: Image(
                                width: 20,
                                height: 20,
                                image: AssetImage("assets/images/gitred.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                _launchURL(
                                    "https://www.instagram.com/flutterdevtech/");
                              },
                              child: Image(
                                width: 20,
                                height: 20,
                                image: AssetImage(
                                    "assets/images/instagramred.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                      "DESIGNED AND DEVELOPED BY YOURS TRULY. Gautam Yadav",
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              color: black,
                              fontSize: ScreenUtil()
                                  .setSp(22, allowFontScalingSelf: true),
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.none))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
