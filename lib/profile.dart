// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 123, 65), // Cor de fundo verde escuro
      appBar: AppBar(
        title: Text('Configurações'),
        backgroundColor: Color.fromARGB(255, 0, 100, 0), // Cor de fundo verde mais escuro para o AppBar
        elevation: 0, // Sem sombra na barra de navegação
      ),
      body: Container(
        color: Color.fromARGB(255, 199, 241, 195), // Cor de fundo verde claro
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'lib/_images/profile.jpg',
                    width: 90,
                    height: 90,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Nome do usuário',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 25),
              const Text(
                'Acessibilidades',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildAccessibilityContainer('Acessibilidade 1'),
                        _buildAccessibilityContainer('Acessibilidade 2'),
                        _buildAccessibilityContainer('Acessibilidade 3'),
                        _buildAccessibilityContainer('Acessibilidade 4'),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildAccessibilityContainer('Acessibilidade 5'),
                        _buildAccessibilityContainer('Acessibilidade 6'),
                        _buildAccessibilityContainer('Acessibilidade 7'),
                        _buildAccessibilityContainer('Acessibilidade 8'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contatos de emergência',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 8.0),
                      Text(
                        '+55 123 456 789',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 8.0),
                      Text(
                        '+55 987 654 321',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccessibilityContainer(String text) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: false,
            onChanged: (newValue) {
              // mudança da checkbox
            },
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}