import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'mainScreen.dart';
import 'one_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({key}) : super(key: key);
  static const String id = 'splash-screen';


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final store = GetStorage();
  void initState() {
    Timer(
      const Duration(seconds: 3), () {
      var _boarding = store.read('OnBoarding');
      _boarding == null ? Navigator.pushReplacementNamed(context, OneBoardingScreen.id) :
      _boarding == true ? Navigator.pushReplacementNamed(context, MainScreen.id):
      Navigator.pushReplacementNamed(context, OneBoardingScreen.id);
    },
    );
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
