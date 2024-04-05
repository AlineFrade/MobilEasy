import 'package:flutter/material.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Perfil'),
        centerTitle: true,
        backgroundColor: Colors.green[900], // Cor verde escuro para o AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_icon.png'), // Ícone de perfil
            ),
            SizedBox(height: 20),
            _buildTextField('Nome Completo', Icons.person),
            SizedBox(height: 10),
            _buildTextField('Email', Icons.email),
            SizedBox(height: 10),
            _buildTextField('Senha', Icons.lock),
            SizedBox(height: 10),
            _buildTextField('Data de Nascimento', Icons.calendar_today),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para finalizar cadastro
              },
              child: Text('Finalizar Cadastro'),
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