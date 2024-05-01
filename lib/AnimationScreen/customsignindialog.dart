import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animationscreen_venkat/AnimationScreen/signinform.dart';
import 'package:flutter_svg/svg.dart';

Future<Object?> customSigninDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign In",
    context: context,
    transitionDuration: Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) =>
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SingleChildScrollView(
        child: Container(
          height: 620,
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.94),
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children:[
                      Text(
                        'Sign In',
                        style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          'Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SingleChildScrollView(child: const SignInForm()),
                      SingleChildScrollView(
                        child: Row(
                          children: const [
                            Expanded(child: Divider()),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'OR',
                                style: TextStyle(color: Colors.black26),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: SizedBox(
                          child: Text(
                            'Sign up with Email, Apple or Google',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        child: SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/email_box.svg',
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/apple_box.svg',
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/google_box.svg',
                                  height: 40,
                                  width: 40,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const Positioned(
                    right:120,
                    bottom: -58,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]),
  ).then(onClosed);
}
