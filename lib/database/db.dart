import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class RegisterDatabase {
  static recoverDB() async {
    final pathDB = await getDatabasesPath();
    final localDB  = join(pathDB, "banco.db");
    var db = await openDatabase(
      localDB,
      version: 1,
      onCreate: (db, dbVersaoRecente) {
        String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, email VARCHAR, senha VARCHAR) ";
        db.execute(sql);
      }
    );
    return db;
    // print("BD acessado: " + db.isOpen.toString());
  }

   static saveDados(String nome, String email, String senha) async {
    Database bd = await recoverDB();
    Map<String, dynamic> dadosUser = {
      "nome" : nome,
      "email": email,
      "senha": senha
    };
    int id = await bd.insert("usuarios", dadosUser);
    print("Usuário Salvo ID: $id " + "Nome: $nome");
  }






}