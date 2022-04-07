import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

import '../main.dart';
import 'call_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  bool _validateError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  child: Text(
                    'e-Learning',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: "cairo",
                    ),
                  ),
                  //  Image.asset(
                  //   'assets/agora-logo.png',
                  //   color: kSecondaryColor,
                  // ),
                  // height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                const Text(
                  'Enter the code ',
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                      labelText: 'Enter Code',
                      labelStyle:
                          const TextStyle(color: Colors.white, fontSize: 18),
                      errorText:
                          _validateError ? 'Code or link is mandatory' : null,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: kSecondaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kSecondaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kSecondaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kSecondaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: MaterialButton(
                    onPressed: onJoin,
                    height: 40,
                    color: kSecondaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          'Join',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    setState(() {
      myController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });

    if (myController.text.isEmpty) {
      setState(() {
        _validateError = true;
      });
    } else {
      _validateError = false;
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallPage(channelName: myController.text),
          ));
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
