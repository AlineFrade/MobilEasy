import 'package:MobilEasy/menu.dart';
import 'package:flutter/material.dart';
import 'profile.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Onboarding Screen',
      home: MaterialYou(),
      debugShowCheckedModeBanner: false,
    );
  }
}