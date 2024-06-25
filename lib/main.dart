import 'package:MobilEasy/pages/configurations.dart';
import 'package:MobilEasy/pages/createAccount.dart';
import 'package:MobilEasy/pages/loginPage.dart';
import 'package:MobilEasy/pages/map.dart';
import 'package:MobilEasy/pages/menu.dart';
import 'package:MobilEasy/pages/profile.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: MaterialYou(),
      // home: NavigationPage(),

      routes: {
        'navigationPage': (context) => NavigationPage(),
        'createAccount': (context) => CreateProfile(),
        'configurateProfile': (context) => Configurations(),
        'profilePage': (context) => Profile(),
        'loginPage': (context) => LoginPage(),
      },
    );
  }
}