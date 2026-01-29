import 'package:flutter/material.dart';
import 'package:online_learning_app/constants.dart';

import '../../UI/routes_names.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/splash/splash.png"),
        SizedBox(
          height: 30,
        ),
        Text(
          "Grow Your Skills",
          style: TextStyle(
            fontSize: 25,
            color: Colors.grey.shade900,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Choose Your Course & Start Learning",
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey.shade900,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, RoutesNames.courseHome);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
              child: Text(
                "Getting Started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )
        ),
      ],
      ),
    );
  }
}
