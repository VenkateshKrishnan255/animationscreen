import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'animatedbtn.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  bool isSignInDialogShow = false;
  late RiveAnimationController
  _btnAnimationController; //Declaration of RiveanimationController

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            //height: 300,
              bottom: 100,
              left: 100,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 1.7,
              child: Image.asset("assets/Backgrounds/Spline.png")),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 10,
              ),
            ),
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 30,
                sigmaY: 30,
              ),
              child: SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isSignInDialogShow ? -50 : 0,
            duration: Duration(milliseconds: 240),
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    SizedBox(
                        width: 200,
                        child: Column(
                          children: const [
                            Text(
                              'Tidy Life India Pvt Ltd',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontFamily: 'Poppins',
                                  height: 1.2,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                                "Don't skip design. Learn Design and code, by building real app with Flutter and Swift. Complete courses about the best tools.")
                          ],
                        )),
                    const Spacer(flex: 2),

                    //Object Creation,Object Calling
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;
                       //Navigater
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          'Purchase inclues access to 30+ courses, 240+ premium tutorial, 120+ hours of videos, source files and certificates.'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

