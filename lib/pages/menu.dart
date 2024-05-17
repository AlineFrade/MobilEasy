import 'package:MobilEasy/pages/createAccount.dart';
import 'package:MobilEasy/pages/loginPage.dart';
import 'package:MobilEasy/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:MobilEasy/pages/configurations.dart';
import 'package:MobilEasy/pages/map.dart';

const TextStyle _textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class MaterialYou extends StatefulWidget {
  const MaterialYou({Key? key}) : super(key: key);

  @override
  State<MaterialYou> createState() => _MaterialYouState();
}

class _MaterialYouState extends State<MaterialYou> {
  int _currentIndex = 0;
  List<Widget> pages = const [
    Profile(),
    Configurations(),
    NavigationPage(),
    //Text('MAP', style: _textStyle),
    //CreateProfile(),
    LoginPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('MobilEasy'),
        backgroundColor: Color.fromARGB(255, 205, 152, 8),
      ),*/
      backgroundColor: Color.fromARGB(255, 9, 79, 10),
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          top: 1.0,
          bottom: 5.0,
          left: 1.5,
          right: 1.5,
        ), // Defina a quantidade de preenchimento desejada aqui
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), // Raio superior esquerdo
            topRight: Radius.circular(20.0), // Raio superior direito
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorShape: RoundedRectangleBorder(
                // Defina a forma do indicador
                borderRadius:
                    BorderRadius.circular(50), // Raio do indicador retangular
              ),
              indicatorColor:
                  Color.fromARGB(255, 224, 171, 136).withOpacity(0.5),
            ),
            child: NavigationBar(
              backgroundColor: Color.fromARGB(255, 49, 123, 65), // Cor de fundo
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              animationDuration: const Duration(milliseconds: 20),
              height: 55,
              selectedIndex: _currentIndex,
              onDestinationSelected: (int newIndex) {
                setState(() {
                  _currentIndex = newIndex;
                });
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.person_outlined,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  selectedIcon: Icon(Icons.person_outlined,
                      color: Color.fromARGB(255, 185, 213, 131)),
                  label: 'Profile',
                ),
                NavigationDestination(
                  icon: Icon(Icons.change_circle_outlined,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  selectedIcon: Icon(Icons.change_circle_outlined,
                      color: Color.fromARGB(255, 185, 213, 131)),
                  label: 'Change profile',
                ),
                NavigationDestination(
                  icon: Icon(Icons.home_outlined,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  selectedIcon: Icon(Icons.home_outlined,
                      color: Color.fromARGB(255, 104, 60, 10)),
                  label: 'home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_add_alt_1_outlined,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  selectedIcon: Icon(Icons.person_add_alt_1_outlined,
                      color: Color.fromARGB(255, 104, 60, 10)),
                  label: 'Create  Account',
                ),
                NavigationDestination(
                  icon: Icon(Icons.lock_outline,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  selectedIcon: Icon(Icons.lock_outline,
                      color: Color.fromARGB(255, 104, 60, 10)),
                  label: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
