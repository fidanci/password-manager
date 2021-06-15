import 'package:password_manager/core/model/passwrod_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class IPasswordsDatabase {
  Future<bool> insert(PasswordModel model);
  Future<PasswordModel?> readPasswordItem(int id);
  Future<List<PasswordModel>> readAllPasswordItem();
  Future<bool> updatePassword(PasswordModel model);
  Future<bool> deletePassword(int id);
  Future<void> close();
}

class PasswordsDatabase extends IPasswordsDatabase {
  static Database? _database;

  String _passwordDatabaseName = "passwordDatabase";
  String _passwordTableName = "passwords";
  int _version = 1;

  String _columnId = "id";
  String _columnUserName = "userName";
  String _columnPassURL = "passURL";
  String _columnPassword = "password";

  static final PasswordsDatabase instance = PasswordsDatabase._init();
  PasswordsDatabase._init();

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initialDatabase();
    }
    return _database;
  }

  Future<Database?> initialDatabase() async {
    String dbPath = join(await getDatabasesPath(), _passwordDatabaseName);
    var passwordDB = await openDatabase(
      dbPath,
      version: _version,
      onCreate: _createTable,
    );
    return passwordDB;
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
  CREATE TABLE $_passwordTableName (
	$_columnId	INTEGER,
	$_columnUserName	TEXT,
	$_columnPassURL	TEXT,
	$_columnPassword	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
  )
  ''');
  }

  @override
  Future<List<PasswordModel>> readAllPasswordItem() async {
    Database? db = await this.database;
    var result = await db?.query("$_passwordTableName");
    return result!.map((e) => PasswordModel.fromJson(e)).toList();
  }

  Future<PasswordModel?> getItemById(int? id) async {
    Database? db = await this.database;
    List<Map<String, Object?>>? list =
        await db?.rawQuery("Select * from todos where id = ?", [id]);
    if (list!.isNotEmpty) {
      return PasswordModel.fromJson(list.first);
    } else {
      return null;
    }
  }

  @override
  Future<PasswordModel?> readPasswordItem(int? id) async {
    Database? db = await this.database;
    final passwordMaps = await db?.query(
      _passwordTableName,
      where: '$_columnId = ?',
      whereArgs: [id],
    );

    if (passwordMaps!.isNotEmpty) {
      return PasswordModel.fromJson(passwordMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<bool> insert(PasswordModel model) async {
    Database? db = await this.database;
    final passwordMaps = db?.insert(
      _passwordTableName,
      model.toJson(),
    );
    return passwordMaps != null;
  }

  @override
  Future<bool> updatePassword(PasswordModel model) async {
    Database? db = await this.database;

    final passwordMaps = await db?.update(
      _passwordTableName,
      model.toJson(),
      where: '$_columnId = ?',
      whereArgs: [model.id],
    );

    return passwordMaps != null;
  }

  @override
  Future<bool> deletePassword(int id) async {
    Database? db = await this.database;

    final userMaps = await db?.delete(
      _passwordTableName,
      where: '$_columnId = ?',
      whereArgs: [id],
    );

    return userMaps != null;
  }

  @override
  Future<void> close() async {
    Database? db = await this.database;
    await db?.close();
  }
}
