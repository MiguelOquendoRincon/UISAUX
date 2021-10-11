import 'package:sqflite/sqflite.dart';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uis_aux/models/usuario_model.dart';

class DBPovider {
  static Database _database;

  static final DBPovider db = DBPovider._();

  DBPovider._();

  Future<Database> get databasePro async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'UisAux.db');
    print("creando base de datos");
    return await openDatabase(path, version: 38, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Users (id INTEGER, usuario TEXT PRIMARY KEY, nombre TEXT, celular TEXT, rol TEXT, apellido TEXT, password TEXT)");
      // await db.execute("CREATE TABLE Auxiliaturas (id INTEGER PRIMARY KEY, nombre TEXT, disponibilidad TEXT, responsable TEXT,)");
    });
  }

  // Crear Registros
  nuevoUsuario(Usuario user) async {
    final db = await databasePro;
    final res = await db.rawInsert("INSERT Into Users (id, usuario, nombre, celular, rol, apellido, password) "
        "VALUES (${user.id}, '${user.usuario}', '${user.nombre}', '${user.phone}', '${user.rol}', '${user.apellido}', '${user.password}')");
    return res;
  }

  // SELECT - Obtener informacion
  Future<Usuario> getUsuarioByUser(String usuario) async {
    final db = await databasePro;
    final res = await db.rawQuery("SELECT * FROM Users WHERE usuario = '$usuario'");
    return res.isNotEmpty ? Usuario.fromJson(res.first) : null;
  }


  Future<List<Usuario>> getScansPorTipo(String usuario) async {
    final db = await databasePro;

    final res = await db.rawQuery("SELECT * FROM Users WHERE tipo = '$usuario'");

    List<Usuario> list =
        res.isEmpty ? res.map((f) => Usuario.fromJson(f)).toList() : [];
    return list;
  }

  //Actualizar Registros
  Future<int> updateScan(Usuario newUser) async {
    final db = await databasePro;

    final res = await db.update('Usuario', newUser.toJson(),
        where: 'id = ?', whereArgs: [newUser.usuario]);

    return res;
  }

  //eliminar registros
  Future<int> deleteScan(int id) async {
    final db = await databasePro;

    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);

    return res;
  }

  Future<int> deleteAll() async {
    final db = await databasePro;

    final res = await db.rawDelete("DELETE FROM Scans");

    return res;
  }


}
