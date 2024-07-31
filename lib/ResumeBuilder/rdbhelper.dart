import 'package:path/path.dart';
import 'package:rnewapp/ResumeBuilder/model/Users.dart';
import 'package:rnewapp/ResumeBuilder/model/education.dart';
import 'package:rnewapp/ResumeBuilder/model/experience.dart';
import 'package:rnewapp/ResumeBuilder/model/project.dart';
import 'package:sqflite/sqflite.dart';

import 'model/skill.dart';

class DbHelper {
  // database name
  static final String _dbName = 'resume.db';

  // database version
  static int _dbVersion = 1;

  // tables name
  static final String _tableUser = 'resume';
  static final String _tableEdu = 'Education';
  static final String _tableExp = 'Experience';
  static final String _tablePro = 'Project';
  static final String _tableSkill = 'Project';

  // Column name Personal Detail
  static final String _id = 'id';
  static final String _firstName = 'firstName';
  static final String _middleName = 'middleName';
  static final String _lastName = 'lastName';
  static final String _jobTitle = 'jobTitle';
  static final String _dob = 'dob';
  static final String _gender = 'gender';
  static final String _mobileNum = 'mobileNum';
  static final String _email = 'email';
  static final String _address = 'address';

  // Column name Educational Detail
  static final String _ide = 'ide';
  static final String _sNameT = 'sNameT';
  static final String _timeT = 'timeT';
  static final String _perT = 'perT';

  static final String _sNameTw = 'sNameTw';
  static final String _streamTw = 'streamTw';
  static final String _timeTw = 'timeTw';
  static final String _perTw = 'perTw';

  static final String _sNameGr = 'sNameGr';
  static final String _locationGr = 'locationGr';
  static final String _timeGr = 'timeGr';
  static final String _resultGr = 'resultGr';

  static final String _sNameMo = 'sNameMo';
  static final String _locationMo = 'locationMo';
  static final String _timeMo = 'timeMo';
  static final String _resultMo = 'resultMo';

  // Column name Experience Detail
  static final String _idex = 'idex';
  static final String _title = 'title';
  static final String _company = 'company';
  static final String _duration = 'duration';
  static final String _description = 'description';

  // Column name Experience Detail
  static final String _idpro = 'idpro';
  static final String _pTitle = 'pTitle';
  static final String _pCompany = 'pCompany';
  static final String _pDuration = 'pDuration';
  static final String _pDescription = 'pDescription';

  // Column name Skill Detail
  static final String _idsk = 'idsk';
  static final String _skill = 'skill';

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
      onCreate: _onCreate,
    );
  }

// personal detail page no data insert :-
  Future<int> insertUser(Users user) async {
    final db = await getDatabase();
    print('Insert success Personal Detail');
    return await db!.insert(_tableUser, user.toMap());
  }

// educational detail page no data insert :-
  Future<int> insertEdu(Education education) async {
    final db = await getDatabase();
    print('Insert success Educational Detail');
    return await db!.insert(_tableEdu, education.toMap());
  }

  // educational detail page no data insert :-
  Future<int> insertExp(Experience experience) async {
    final db = await getDatabase();
    print('Insert success Experience Detail');
    return await db!.insert(_tableExp, experience.toMap());
  }

  // educational detail page no data insert :-
  Future<int> insertPro(Project project) async {
    final db = await getDatabase();
    print('Insert success Project Detail');
    return await db!.insert(_tablePro, project.toMap());
  }

  // educational detail page no data insert :-
  Future<int> insertSk(Skill skill) async {
    final db = await getDatabase();
    print('Insert success Skill Detail');
    return await db!.insert(_tableSkill, skill.toMap());
  }


// personal detail page no data get :-
  Future<List<Users>?> getUsersList() async {
    final db = await getDatabase();
    final List<Map<String, Object?>>? userMaps = await db?.query(_tableUser);

    return userMaps
        ?.map((element) => Users(
      id: element['id'] as int,
      firstName: element['firstName'] as String,
      middleName: element['middleName'] as String,
      lastName: element['lastName'] as String,
      jobTitle: element['jobTitle'] as String,
      dob: element['dob'] as String,
      gender: element['gender'] as String,
      mobileNum: element['mobileNum'] as String,
      email: element['email'] as String,
      address: element['address'] as String,
    ))
        .toList();
  }
// educational detail page no data get :-
  Future<List<Education>?> getEduList() async {
    final db = await getDatabase();
    final List<Map<String, Object?>>? eduMaps = await db?.query(_tableEdu);

    return eduMaps
        ?.map((element) =>
        Education(
          ide: element['ide'] as int,
          sNameT: element['sNameT'] as String,
          timeT: element['timeT'] as String,
          perT: element['perT'] as int,

          sNameTw: element['sNameTw'] as String,
          streamTw: element['streamTw'] as String,
          timeTw: element['timeTw'] as String,
          perTw: element['perTw'] as int,

          sNameGr: element['sNameGr'] as String,
          locationGr: element['locationGr'] as String,
          timeGr: element['timeGr'] as String,
          resultGr: element['resultGr'] as int,

          sNameMo: element['sNameMo'] as String,
          locationMo: element['locationMo'] as String,
          timeMo: element['timeMo'] as String,
          resultMo: element['resultMo'] as int,

    ),)
        .toList();
  }

  // Experience detail page no data get :-
  Future<List<Experience>?> getExpList() async {
    final db = await getDatabase();
    final List<Map<String, Object?>>? expMaps = await db?.query(_tableExp);

    return expMaps
        ?.map((element) => Experience(
      idex: element['idex'] as int,
      title: element['title'] as String,
      company: element['Company'] as String,
      duration: element['duration'] as String,
      description: element['description'] as String,
    ))
        .toList();
  }

  // Project detail page no data get :-
  Future<List<Project>?> getProList() async {
    final db = await getDatabase();
    final List<Map<String, Object?>>? proMaps = await db?.query(_tablePro);

    return proMaps
        ?.map((element) => Project(
      idpro: element['idpro'] as int,
      pTitle: element['pTitle'] as String,
      pCompany: element['pCompany'] as String,
      pDuration: element['pDuration'] as String,
      pDescription: element['pDescription'] as String,
    ))
        .toList();
  }

  // Skill detail page no data get :-
  Future<List<Skill>?> getSkList() async {
    final db = await getDatabase();
    final List<Map<String, Object?>>? skMaps = await db?.query(_tableSkill);

    return skMaps
        ?.map((element) => Skill(
      idsk: element['idsk'] as int,
      skill: element['skill'] as String,
    ))
        .toList();
  }

  Future<Database?> _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $_tableUser ('
          '$_id INTEGER PRIMARY KEY AUTOINCREMENT,'
          '$_firstName TEXT NOT NULL,'
          '$_middleName TEXT NOT NULL,'
          '$_lastName TEXT NOT NULL,'
          '$_jobTitle TEXT NOT NULL,'
          '$_dob TEXT NOT NULL,'
          '$_gender TEXT NOT NULL,'
          '$_mobileNum INTEGER NOT NULL,'
          '$_email TEXT NOT NULL,'
         ' $_address TEXT NOT NULL)');

    await db.execute('CREATE TABLE $_tableEdu ('
          '$_ide INTEGER PRIMARY KEY AUTOINCREMENT,'
          '$_sNameT TEXT NOT NULL,'
          '$_timeT TEXT NOT NULL,'
          '$_perT INTEGER NOT NULL,'
          '$_sNameTw TEXT NOT NULL,'
          '$_streamTw TEXT NOT NULL,'
          '$_timeTw TEXT NOT NULL,'
          '$_perTw INTEGER NOT NULL,'
          '$_sNameGr TEXT NOT NULL,'
          '$_locationGr TEXT NOT NULL,'
          '$_timeGr TEXT NOT NULL,'
          '$_resultGr INTEGER NOT NULL,'
          '$_sNameMo TEXT NOT NULL,'
          '$_locationMo TEXT NOT NULL,'
          '$_timeMo TEXT NOT NULL,'
          '$_resultMo INTEGER NOT NULL)');

    await db.execute('CREATE TABLE $_tableExp ('
        '$_idex INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$_title TEXT NOT NULL,'
        '$_company TEXT NOT NULL,'
        '$_duration TEXT NOT NULL,'
        '$_description TEXT NOT NULL)');

    await db.execute('CREATE TABLE $_tablePro ('
        '$_idpro INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$_pTitle TEXT NOT NULL,'
        '$_pCompany TEXT NOT NULL,'
        '$_pDuration TEXT NOT NULL,'
        '$_pDescription TEXT NOT NULL)');

    await db.execute('CREATE TABLE $_tableSkill ('
        '$_idpro INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$_skill TEXT NOT NULL,');

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