import 'package:flutter/material.dart';
import 'package:MobilEasy/pages/map.dart';
import 'package:MobilEasy/pages/createAccount.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.traffic,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'MobilEasy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Semantics(
                  label: 'Botão para fazer login',
                  child: ElevatedButton(
                      onPressed: () {
                      Navigator.pushNamed(context, 'userListPage');
                  },
                  child: Text('Login'),
                  ),
                ),
                Semantics(
                  label: 'Botão para criar conta',
                  child: ElevatedButton(
                    onPressed: () {
                    Navigator.pushNamed(context, 'createAccount');
                  },
                  child: Text('Criar Conta'),
                ),
                )
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}