import 'package:path/path.dart';
import 'package:rnewapp/ResumeBuilder/model/Users.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  // database name
  static final String _dbName = 'resume.db';

  // database version
  static int _dbVersion = 1;

  // tables name
  static final String _tableUser = 'resume';

  // Column name
  static final String _id = 'id';
  static final String _firstName = 'firstName';
  static final String _middleName = 'middleName';
  static final String _lastName = 'lastName';
  static final String _dob = 'dob';
  static final String _gender = 'gender';
  static final String _mobile = 'mobile';
  static final String _email = 'email';
  static final String _address = 'address';

  static Database? _database;

  Future<Database?> getDatabase() async {
    if (_database == null) {
      _database = await createDatabase();
    }
    return _database;
  }

  Future<Database> createDatabase() async {
    var path = join(await getDatabasesPath(), _dbName);
    print('Database path: $path');

    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) {
        return db.execute('''
        CREATE TABLE $_tableUser (
          $_id INTEGER PRIMARY KEY AUTOINCREMENT,
          $_firstName TEXT,
          $_middleName TEXT,
          $_lastName TEXT,
          $_dob TEXT,
          $_gender TEXT,
          $_mobile INTEGER,
          $_email TEXT,
          $_address TEXT
        )
      ''');
      },
    );
  }


  Future<int> insertUser(Users user) async {
    final db = await getDatabase();
    print('Insert success');
    return await db!.insert(_tableUser, user.toMap());
  }

  Future<List<Users>?> getUsersList() async {
    final db = await getDatabase();
    final List<Map<String, Object?>>? userMaps = await db?.query(_tableUser);

    return userMaps
        ?.map((element) => Users(
      id: element[_id] as int,
      firstName: element[_firstName] as String,
      middleName: element[_middleName] as String,
      lastName: element[_lastName] as String,
      dob: element[_dob] as String,
      gender: element[_gender] as String,
      mobile: element[_mobile] as int,
      email: element[_email] as String,
      address: element[_address] as String,
    ))
        .toList();
  }
}


// Future<int> update(Users user) async {
//   final db = await getDatabase();
//   print('${user.id} ${user.name}');
//   print('update in dbhelper called');

//   try {
//     return await db!.update(
//       _tableUser,
//       user.toMapID(),
//       where: 'id = ?',
//       whereArgs: [user.id],
//     );
//   } catch (e) {
//     print(e.toString());
//     return -1;
//   }
// }
