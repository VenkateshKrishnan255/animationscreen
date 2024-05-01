import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isShowLoading = false;
  bool isShowConfetti = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  StateMachineController getRiveController(Artboard artboard){
    StateMachineController ? controller = StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller;
  }
  void signIn(BuildContext context){
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });
    Future.delayed(Duration(seconds: 1),() {
      if(_formKey.currentState!.validate()){
        check.fire();
        Future.delayed(Duration(seconds: 2),(){
          setState(() {
            isShowLoading=false;
          });
          confetti.fire();
          //Navigater
        },
        );
      }
      else{
        error.fire();
        Future.delayed(Duration(seconds: 2), (){
          setState(() {
            isShowLoading=false;
          });
        },);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    child: Text('Email',style: TextStyle(color: Colors.black54,fontSize: 18),)),
                Padding(
                  padding: const EdgeInsets.only(top: 8,bottom: 16),
                  child: SizedBox(
                    width: 320,
                    height: 63,
                    child: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return"";
                            }
                            return null;
                          },
                          onSaved: (email){},
                          decoration: InputDecoration(
                              hoverColor: Colors.black,
                              border: OutlineInputBorder(),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: SvgPicture.asset("assets/icons/email.svg"),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    child: Text('Password',style: TextStyle(color: Colors.black54,fontSize: 18),)),
                Padding(
                  padding: const EdgeInsets.only(top: 8,bottom: 16),
                  child: SizedBox(
                    width: 320,
                    height: 63,
                    child: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return"";
                            }
                            return null;
                          },
                          onSaved: (email){},
                          obscureText: true,
                          decoration: InputDecoration(
                              hoverColor: Colors.black,
                              border: OutlineInputBorder(),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: SvgPicture.asset("assets/icons/password.svg"),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8,bottom: 24),
                    child: SingleChildScrollView(
                      child: ElevatedButton.icon(
                        onPressed: (){
                          signIn(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFF77D8E),
                            minimumSize: Size(double.infinity, 56),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)
                                )
                            )
                        ),
                        icon: Icon(CupertinoIcons.arrow_right,color: Colors.pink),
                        label: Text("Sign In",style: TextStyle(color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        isShowLoading ? CustomPositional(child: RiveAnimation.asset('assets/RiveAssets/check.riv',
          onInit: (artboard){
            StateMachineController controller = getRiveController(artboard);
            check = controller.findSMI('Check') as SMITrigger;
            error = controller.findSMI('Error') as SMITrigger;
            reset = controller.findSMI('Reset') as SMITrigger;
          },
        ),
        ): const SizedBox(),
       isShowConfetti ? CustomPositional(
           child: Transform.scale(
          scale:4,
          child: RiveAnimation.asset('assets/RiveAssets/confetti.riv',
          onInit: (artboard){
            StateMachineController controller = getRiveController(artboard);
            confetti = controller.findSMI('Trigger explosion') as SMITrigger;
          },
          ),
        )
       ):SizedBox()
      ],
    );
  }
}

class CustomPositional extends StatelessWidget {
  const CustomPositional({super.key, required this.child, this.size=100});

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            height: size,
            width: size,
            child: child
          ),
          Spacer(flex: 2,)
        ],
      ),
    );
  }
}
