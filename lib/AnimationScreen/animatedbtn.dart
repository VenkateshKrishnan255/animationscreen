import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {

  //Actual Arugements(Accept the Data and Store the data)
  const AnimatedBtn({
    super.key,
    required RiveAnimationController btnAnimationController, required this.press,
  }) : _btnAnimationController = btnAnimationController;

  //Declaration Statement
  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {

    //We can use ontap animation purpose
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            RiveAnimation.asset('assets/RiveAssets/button.riv',controllers: [_btnAnimationController],
            ),
            Positioned.fill(
                top: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,//Align vertical
                  children: const[
                    Icon(CupertinoIcons.arrow_right),//Creating arrowicon
                    SizedBox(width: 10),
                    Text('Get Started',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}