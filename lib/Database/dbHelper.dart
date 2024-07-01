import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'model/user.dart';

class DbHelper {
  // database name
  static final String _dbName = 'angel.db';

  // database version
  static int _dbVersion = 1;

  // tables name
  static final String _tableUser = 'user';

  // Column name
  static final String _id = 'id';
  static final String _name = 'name';
  static final String _email = 'email';
  static final String _age = 'age';

  //static final String _date = 'date';

  static Database? _database;

  Future<Database?> getDatabase() async {
    if (_database == null) {
      _database = await createDatabase();
    }
    return _database;
  }

  Future<Database> createDatabase() async {
    var path = join(await getDatabasesPath(), _dbName);
    print('database path : $path');

    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) {
        return db.execute('CREATE TABLE $_tableUser('
            '$_id INTEGER PRIMARY KEY AUTOINCREMENT , '
            '$_name TEXT, '
            '$_email TEXT,'
            '$_age INTEGER)');
      },
    );
  }

  Future<int> insert(User user) async {
    final db = await getDatabase();
    return await db!.insert(_tableUser, user.toMap());
  }

  Future<List<User>?> getUserList() async {
    final db = await getDatabase();
    final List<Map<String, Object?>>? userMaps = await db?.query(_tableUser);

    return userMaps?.map((element) =>
        User.withID(
            id: element['id'] as int,
            name: element['name'] as String,
            email: element['email'] as String,
            age: element['age'] as int)).toList();
  }

  Future<int> update(User user) async {
    final db = await getDatabase();
    print('${user.id} ${user.name}');
    print('update in dbhelper called');

    try{
      return await db!.update(
        _tableUser,
        user.toMapID(),
        where: 'id = ?',
        whereArgs: [user.id],
      );
    }
    catch(e){
      print(e.toString());
      return -1;
    }
  }

  Future<void> delete(int id) async {
    final db = await getDatabase();

    try{
      await db!.delete(
        _tableUser,
        where: 'id = ?',
        whereArgs: [id],
      );
    }
    catch(e){
      print(e.toString());
    }
  }

}