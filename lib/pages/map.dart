import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 100, 0),
        title: Text('Navegação'),
        //automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Digite o local de partida',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Digite o local de destino',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Lógica para iniciar a navegação
              },
              child: Text('Iniciar Navegação'),
            ),
          ),
          Container(
            height: 300, // Defina a altura desejada para a imagem
            width: 200, // Para ocupar toda a largura disponível
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Expanded(child: Image.network('https://i.ibb.co/42ZqFYD/praia.jpg', semanticLabel: 'Foto de praia'),
              ),
            ],)
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: "Acessibilidade",
        child: Icon(Icons.accessibility),
      ),

    );
  }
}