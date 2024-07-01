import 'package:rnewapp/Database/model/student.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBhelperPractice{

  // Database name
  static final String _dbName = 'Student.db';

  // Database version
  static int _dbVersion = 1;

  // Table name
  static final String _tableUser = 'student';

  // Column name
  static final String _id = 'id';
  static final String _name = 'name';
  static final String _email = 'email';
  static final String _age = 'age';

  static Database? _database;

  Future<Database?> getDatabase() async {
    if(_database == null){
      _database = await createDatabase();
    }
    return _database;
  }

  Future<Database?> createDatabase() async {
    var path = join(await getDatabasesPath(),_dbName);
    print('Database Path : $path');

    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) {
        return db.execute('CREATE TABLE $_tableUser('
            '$_id INTEGER PRIMARY KEY AUTOINCREMENT , '
            '$_name TEXT, '
            '$_email TEXT,'
            '$_age INTEGER)'
        );
      },
    );
  }

  Future<int> insert(Student student) async {
    final db = await _database;
    return await db!.insert(_tableUser, student.toMap());
  }

}