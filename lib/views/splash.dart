import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pfel/main.dart';
import 'package:pfel/views/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          const Center(
            child: Text(
              "PFEL PROJECT",
              style: TextStyle(
                color: kSecondaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: const [
              Expanded(
                child: SizedBox(
                  height: 2,
                ),
              ),
              SizedBox(
                height: 20,
                child: Center(
                  child: Text(
                    "made by AYOUB & CHAOUCHE",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
