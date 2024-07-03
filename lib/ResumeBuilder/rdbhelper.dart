// ignore_for_file: prefer_const_declarations, prefer_conditional_assignment
import 'package:path/path.dart ';
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
  static final String firstName = 'firstName';
  static final String middleName = 'middleName';
  static final String lastName = 'lastName';
  static final String dob = 'dob';
  static final String gender = 'gender';
  static final String mobile = 'mobile';
  static final String email = 'email';
  static final String address = 'address';

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
            '$firstName TEXT, '
            '$middleName TEXT,'
            '$lastName TEXT,'
            '$dob TEXT'
            '$gender TEXT,'
            '$mobile INTEGER,'
            '$email TEXT,'
            '$address TEXT)');
      },
    );
  }

  Future<int> insert(Users user) async {
    final db = await getDatabase();
    print('insert success');
    return await db!.insert(_tableUser, user.toMap());
  }

  Future<List<Users>?> getList() async {
    final db = await getDatabase();
    final List<Map<String, Object?>>? userMaps = await db?.query(_tableUser);

    return userMaps
        ?.map((element) => Users(
          id: element['id'] as int,
          firstName: element['firstName'] as String,
          middleName: element['middleName'] as String,
          lastName: element['lastName'] as String,
          dob: element['dob'] as String,
          gender: element['gender'] as String,
          mobile: element['mobile'] as int,
          email: element['email'] as String,
          address: element['address'] as String,
    ))
        .toList();
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
}