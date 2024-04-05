// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Configurations extends StatelessWidget {
  const Configurations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 241, 195), // Cor de fundo verde claro
      appBar: AppBar(
        title: Text('Alteração de Cadastro'),
        backgroundColor: Color.fromARGB(255, 0, 100, 0), // Cor de fundo verde escuro para o AppBar
        elevation: 0, // Sem sombra na barra de navegação
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/_images/profile.jpg'), // Foto da pessoa
            ),
            SizedBox(height: 20),
            _buildTextField('Alterar Nome', Icons.person), // Campo para alterar nome
            SizedBox(height: 10),
            _buildTextField('Alterar E-mail', Icons.email), // Campo para alterar e-mail
            SizedBox(height: 10),
            _buildTextField('Alterar Senha', Icons.lock), // Campo para alterar senha
            SizedBox(height: 10),
            _buildTextField('Confirmar Senha', Icons.lock), // Campo para confirmar senha
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para salvar as alterações
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}