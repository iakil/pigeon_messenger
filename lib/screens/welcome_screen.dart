import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pigeon_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation =
        ColorTween(begin: Colors.amber, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset(
                      'images/logo.png',
                      alignment: Alignment.center,
                    ),
                    height: 60.0,
                  ),
                ),
                ColorizeAnimatedTextKit(
                  text: ['    Pigeon'],
                  textAlign: TextAlign.center,
                  colors: [Colors.green, Colors.red],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 38.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.amberAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Sign Up',
              colour: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
            SizedBox(height: 50),
            Column(
              children: [
                Text(
                  "Made By Akil",
                  textAlign: TextAlign.center,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
