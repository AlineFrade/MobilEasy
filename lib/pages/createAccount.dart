import 'package:MobilEasy/pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:MobilEasy/database/db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile ({super.key});

   @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  

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
             //backgroundImage: AssetImage('assets/profile_icon.png'), // Ícone de perfil
            ),
            SizedBox(height: 20),
            _buildTextField('Nome Completo', Icons.person, nameController),
            SizedBox(height: 10),
            _buildTextField('Email', Icons.email, emailController),
            SizedBox(height: 10),
            _buildTextField('Senha', Icons.lock, passwordController),
            SizedBox(height: 10),
            _buildTextField('Data de Nascimento', Icons.calendar_today, birthDateController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _finishRegistration,
              child: Text('Finalizar Cadastro'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, IconData icon, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          controller.text = value; // Salva o valor digitado no controller
        },
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  void _finishRegistration() async {
    RegisterDatabase.saveDados(nameController.text, emailController.text, passwordController.text);
    //LoginPage();
  }
}