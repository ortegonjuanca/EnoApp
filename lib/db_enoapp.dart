import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Fort.dart';
import 'Hidr.dart';

class DBEnoApp {

  static Future<Database> _openDB() async {
    return openDatabase(

      join(await getDatabasesPath(), '_enoapp_database.db'),

      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE fortwine(title TEXT PRIMARY KEY, date TEXT, volumen_vino_alcoholizar TEXT, grado_vino TEXT, grado_deseado TEXT, grado_alcohol_dispone TEXT, volumen_alcohol_necesario TEXT, note TEXT)"
        );

        db.execute(
          "CREATE TABLE hidrvinegar(title TEXT PRIMARY KEY, date TEXT, volumen_vinagre_hidratar TEXT, grado_vinagre TEXT, grado_deseado TEXT, volumen_agua_necesaria TEXT, note TEXT)"
        );
      },

      version: 1,
    );
  }

  static Future<void> insertFort(Fort fort) async {
    // Obtiene una referencia de la base de datos
    final Database db = await _openDB();

    // Inserta el Dog en la tabla correcta. También puede especificar el
    // `conflictAlgorithm` para usar en caso de que el mismo Dog se inserte dos veces.
    // En este caso, reemplaza cualquier dato anterior.
    await db.insert(
      'fortwine',
      fort.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Fort>> forts() async {
    // Obtiene una referencia de la base de datos
    final Database db = await _openDB();

    // Consulta la tabla por todos los Dogs.
    final List<Map<String, dynamic>> maps = await db.query('fortwine');

    // Convierte List<Map<String, dynamic> en List<Dog>.
    return List.generate(maps.length, (i) {
      return Fort(
        title: maps[i]['title'],
        date: maps[i]['date'],
        note: maps[i]['note'],
        volumen_vino_alcoholizar: maps[i]['volumen_vino_alcoholizar'],
        grado_vino: maps[i]['grado_vino'],
        grado_deseado: maps[i]['grado_deseado'],
        grado_alcohol_dispone: maps[i]['grado_alcohol_dispone'],
        volumen_alcohol_necesario: maps[i]['volumen_alcohol_necesario'],
      );
    });
  }

  static Future<bool> exist_fort(String title) async {
    // Obtiene una referencia de la base de datos
    final Database db = await _openDB();

    // Consulta la tabla por todos los Dogs.
    final List<Map<String, dynamic>> maps = await db.query('fortwine', where: "title = ?", whereArgs: [title]);

    if(maps.isEmpty) return false;

    return true;
  }

  static Future<void> updateFort(Fort fort, String title) async {
    // Obtiene una referencia de la base de datos
    final db = await _openDB();

    // Actualiza el Dog dado
    await db.update(
      'fortwine',
      fort.toMap(),
      // Aseguúrate de que solo actualizarás el Dog con el id coincidente
      where: "title = ?",
      // Pasa el id Dog a través de whereArg para prevenir SQL injection
      whereArgs: [title],
    );
  }

  static Future<void> deleteFort(String title) async {
    // Obtiene una referencia de la base de datos
    final db = await _openDB();

    // Elimina el Dog de la base de datos
    await db.delete(
      'fortwine',
      // Utiliza la cláusula `where` para eliminar un dog específico
      where: "title = ?",
      // Pasa el id Dog a través de whereArg para prevenir SQL injection
      whereArgs: [title],
    );
  }


  static Future<void> insertHidr(Hidr hidr) async {
    // Obtiene una referencia de la base de datos
    final Database db = await _openDB();

    // Inserta el Dog en la tabla correcta. También puede especificar el
    // `conflictAlgorithm` para usar en caso de que el mismo Dog se inserte dos veces.
    // En este caso, reemplaza cualquier dato anterior.
    await db.insert(
      'hidrvinegar',
      hidr.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Hidr>> hidrs() async {
    // Obtiene una referencia de la base de datos
    final Database db = await _openDB();

    // Consulta la tabla por todos los Dogs.
    final List<Map<String, dynamic>> maps = await db.query('hidrvinegar');

    // Convierte List<Map<String, dynamic> en List<Dog>.
    return List.generate(maps.length, (i) {
      return Hidr(
        title: maps[i]['title'],
        date: maps[i]['date'],
        note: maps[i]['note'],
        volumen_vinagre_hidratar: maps[i]['volumen_vinagre_hidratar'],
        grado_vinagre: maps[i]['grado_vinagre'],
        grado_deseado: maps[i]['grado_deseado'],
        volumen_agua_necesaria: maps[i]['volumen_agua_necesaria'],
      );
    });
  }

  static Future<bool> exist_hidr(String title) async {
    // Obtiene una referencia de la base de datos
    final Database db = await _openDB();

    // Consulta la tabla por todos los Dogs.
    final List<Map<String, dynamic>> maps = await db.query('hidrvinegar', where: "title = ?", whereArgs: [title]);

    if(maps.isEmpty) return false;

    return true;
  }

  static Future<void> updateHidr(Hidr hidr, String title) async {
    // Obtiene una referencia de la base de datos
    final db = await _openDB();

    // Actualiza el Dog dado
    await db.update(
      'hidrvinegar',
      hidr.toMap(),
      // Aseguúrate de que solo actualizarás el Dog con el id coincidente
      where: "title = ?",
      // Pasa el id Dog a través de whereArg para prevenir SQL injection
      whereArgs: [title],
    );
  }

  static Future<void> deleteHidr(String title) async {
    // Obtiene una referencia de la base de datos
    final db = await _openDB();

    // Elimina el Dog de la base de datos
    await db.delete(
      'hidrvinegar',
      // Utiliza la cláusula `where` para eliminar un dog específico
      where: "title = ?",
      // Pasa el id Dog a través de whereArg para prevenir SQL injection
      whereArgs: [title],
    );
  }
}