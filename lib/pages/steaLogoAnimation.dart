import 'package:flutter/material.dart';
import 'package:stea3/Services/send_receive_testimonies.dart';
import 'package:stea3/pages/register.dart';
import 'package:stea3/widgets/bottomNavigation.dart';
import 'welcomePage.dart';

class SteaAnimation extends StatefulWidget {

  const SteaAnimation({Key key,}) : super(key: key);

  @override
  _SteaAnimationState createState() => _SteaAnimationState();
}

class _SteaAnimationState extends State<SteaAnimation>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reset();
          animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animationController, curve: Curves.fastOutSlowIn))
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context) => RegisterPage()));
              }
            });
          animationController.forward();
        }
      });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return Transform(
              transform: Matrix4.translationValues(
                  animation.value * deviceWidth, 0.0, 0.0),
              child: Container(
                
                height: 200.0,
                width: 200.0,
                //child:  Text("Foodie"),
                
                decoration: BoxDecoration(
                  //color: Colors.blue,
 image: DecorationImage(
                          image: AssetImage("images/stealogo.png"),
                         // fit: BoxFit.cover,
                        ),
                 // borderRadius: BorderRadius.circular(50.0),
                ),
              
              ),
              
            );
          },
        ),
      ),
    );
  }
}
