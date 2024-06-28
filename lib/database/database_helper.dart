import 'package:dafaget_app/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  // Make this class a singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static SharedPreferences? _database;

  //! Get Database
  Future<SharedPreferences> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  //! Initialize Database
  Future<SharedPreferences> _initDatabase() async {
    _database = await SharedPreferences.getInstance();
    return _database!;
  }


  Future<bool> get isDarkMode async {
    final db = await instance.database;
    return db.getBool(Constants.isDarkMode) ?? false;
  }

  Future<bool> setDarkMode(bool isDark) async {
    final db = await instance.database;
    return await db.setBool(Constants.isDarkMode, isDark);
  }
}
