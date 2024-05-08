import 'package:MobilEasy/createAccount.dart';
import 'package:MobilEasy/map.dart';
import 'package:MobilEasy/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      home: MaterialYou(),
      debugShowCheckedModeBanner: false,

      routes: {
        'navigationPage': (context) => NavigationPage(),
        'createAccount': (context) => CreateProfile(),
      },
    );
  }
}