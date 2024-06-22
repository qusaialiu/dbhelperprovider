import 'dart:async';

import 'package:dbhelperprovider/dbhelperprovider.dart';
import 'package:dbhelperprovider/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DbHelperProvider>(context,listen: false).openDataBasefile();
    Timer(Duration(seconds: 3), () {
      Provider.of<DbHelperProvider>(context,listen: false).getAllNotes();
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>MainScreen()));
    });
  }
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
