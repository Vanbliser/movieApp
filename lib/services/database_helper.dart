import 'package:movie_test/models/movies.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static late DatabaseHelper _databaseHelper;
  static late Database _database;

  String movieTable = 'MovieList';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPosterPath = 'posterPath';
  String colBanner = 'banner';
  String colRated = 'rated';
  String colAvgRating = 'avgRating';

  DatabaseHelper._createInstance();

  static late Function checked;
  factory DatabaseHelper() {
    if (hCheck()) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }
  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $movieTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colTitle TEXT, $colDescription TEXT, $colPosterPath TEXT,'
        '$colBanner TEXT, $colRated TEXT, $colAvgRating TEXT)');
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationSupportDirectory();
    String path = directory.path + 'likedMovies.db';
    var movieDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return movieDatabase;
  }

  Future<Database> get database async {
    if (dCheck()) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> getLikedMovieMapList() async {
    Database db = await database;
    var result = await db.query(movieTable);
    return result;
  }

  Future<List<Movie>> getMovieList() async {
    var movieMapList = await getLikedMovieMapList();
    int count = movieMapList.length;
    List<Movie> movieList = [];
    for (var i = 0; i < count; i++) {
      movieList.add(Movie.fromMap(movieMapList[i]));
    }
    return movieList.reversed.toList();
  }

  Future<int> insertLikedMovie(Movie movie) async {
    Database db = await database;
    var result = db.insert(movieTable, movie.toMap());
    return result;
  }

  Future<int> deleteLikedMovie(int id) async {
    var db = await database;
    int result =
        await db.rawDelete('DELETE FROM $movieTable WHERE $colId = $id');
    return result;
  }

  Future<int?> getLikedMovieCount() async {
    Database db = await database;
    List<Map<String, dynamic>> list =
        await db.rawQuery('SELECT COUNT (*) FROM $movieTable');
    int? result = Sqflite.firstIntValue(list);
    return result;
  }

  Future<bool> checkduplicate(Map<String, dynamic> movie) async {
    List<Map<String, dynamic>> list = await getLikedMovieMapList();
    for (var item in list) {
      if (item['posterPath'] == movie['posterPath']) {
        return true;
      }
    }
    return false;
  }
}

int helperCheck = 0;
int dbCheck = 0;
bool hCheck() {
  if (helperCheck == 0) {
    helperCheck++;
    return true;
  } else {
    return false;
  }
}

bool dCheck() {
  if (dbCheck == 0) {
    dbCheck++;
    return true;
  } else {
    return false;
  }
}
