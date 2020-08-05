import 'dart:io';

import 'package:github_stars_app/src/model/githubmodel.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class GitHubStarDBProvider {
  static final GitHubStarDBProvider dbProvider = GitHubStarDBProvider._();
  static Database _database;

  GitHubStarDBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Users.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE Users (
          id INTEGER PRIMARYKEY
          )
          ''');
    });
  }

  //adding a github users
  addPersonToDatabase(Items person) async {
    final db = await database;
    var raw = await db.insert(
      "Users",
      person.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  Future<List<Items>> getAllEmployees() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Users");

    List<Items> list =
        res.isNotEmpty ? res.map((c) => Items.fromJson(c)).toList() : [];

    return list;
  }
}
