import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes/model/model.dart';
import 'package:sqflite/sqflite.dart';

class DB_helper {

  Database? database;
  static DB_helper db_helper = DB_helper();
  final String dbPath = "dbase.db";
  final String dbName = "quote";
  final String dbName2 = "qs";

  Future<Database?> createDB() async {
    if (database != null) {
      return database;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, dbPath);
    String query =
        'CREATE TABLE $dbName (id INTEGER PRIMARY KEY AUTOINCREMENT, img BLOB, category TEXT)';
    String query2 =
        'CREATE TABLE $dbName2 (id INTEGER PRIMARY KEY AUTOINCREMENT, quot TEXT,)';
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(query);
        await db.execute(query2);
      },
    );
  }

  Future<void> insertInDBcate(CategoryModel model) async {
    database = await createDB();
    await database!.insert(dbName, {
      'category': model.cate,
      'img':model.img,
    });
  }

  Future<void> insertInDBquot(quotModel model) async {
    database = await createDB();
    await database!.insert(dbName2, {
      'quot': model.quot,
    });
  }

  Future<List<Map>> readDBcate() async {
    database = await createDB();
    String query = 'SELECT * FROM $dbName';
    List<Map> list = await database!.rawQuery(query);
    return list;
  }
  Future<List<Map>> readDB() async {
    database = await createDB();
    String query2 = 'SELECT * FROM $dbName2';
    List<Map> list = await database!.rawQuery(query2);
    return list;
  }

  Future<Future<int>> delete(id)
  async {
    database = await createDB();
    return database!.delete('$dbName',where:"id=?" ,whereArgs:[id]);
  }

}