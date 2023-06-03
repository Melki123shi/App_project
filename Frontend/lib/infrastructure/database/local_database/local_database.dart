import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CarsLocalDB {
  late final Database database;

  // Initialize the database
  Future<void> initDB() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'carsdb.db');
    database = await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Create the tables
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fullname TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        verification_code TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE car (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        make TEXT NOT NULL,
        model TEXT NOT NULL,
        color TEXT NOT NULL,
        horsepower INTEGER NOT NULL,
        safety_features TEXT,
        price INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE credit (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        car_id INTEGER NOT NULL,
        employee_id INTEGER NOT NULL,
        customer_id INTEGER NOT NULL,
        date TEXT NOT NULL,
        payment_amount INTEGER NOT NULL,
        FOREIGN KEY (car_id) REFERENCES car(id),
        FOREIGN KEY (employee_id) REFERENCES employee(id),
        FOREIGN KEY (customer_id) REFERENCES customer(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE employee (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fullname TEXT NOT NULL,
        username TEXT NOT NULL UNIQUE,
        address TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        phone_no TEXT NOT NULL,
        date_of_hire TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE customer (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        id_photo BLOB NOT NULL,
        fullname TEXT NOT NULL,
      )
    ''');
  }

  // User CRUD operations

  Future<void> insertEmployee(Map<String, dynamic> employee) async {
    final db = database;
    await db.insert(
      'employee',
      employee,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getEmployees() async {
    final db = database;
    final List<Map<String, dynamic>> maps = await db.query('employee');
    return maps;
  }

  Future<void> updateEmployee(Map<String, dynamic> employee) async {
    final db = database;
    await db.update(
      'employee',
      employee,
      where: 'id = ?',
      whereArgs: [employee['id']],
    );
  }

  Future<void> getEmployee(int id) async {
    final db = database;
    await db.query(
      'employee',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteEmployee(int id) async {
    final db = database;
    await db.delete(
      'employee',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Car CRUD operations

  Future<void> insertCar(Map<String, dynamic> car) async {
    final db = database;
    await db.insert(
      'car',
      car,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getCars() async {
    final db = database;
    final List<Map<String, dynamic>> maps = await db.query('car');
    return maps;
  }

   Future<void> getcar(int id) async {
    final db = database;
    await db.query(
      'employee',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateCar(Map<String, dynamic> car) async {
    final db = database;
    await db.update(
      'car',
      car,
      where: 'id = ?',
      whereArgs: [car['id']],
    );
  }

  Future<void> deleteCar(int id) async {
    final db = database;
    await db.delete(
      'car',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Credit CRUD operations

  Future<void> insertCredit(Map<String, dynamic> credit) async {
    final db = database;
    await db.insert(
      'credit',
      credit,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getCredits() async {
    final db = database;
    final List<Map<String, dynamic>> maps = await db.query('credit');
    return maps;
  }
  Future<void> getcredit(int id) async {
    final db = database;
    await db.query(
      'credit',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateCredit(Map<String, dynamic> credit) async {
    final db = database;
    await db.update(
      'credit',
      credit,
      where: 'id = ?',
      whereArgs: [credit['id']],
    );
  }

  Future<void> deleteCredit(int id) async {
    final db = database;
    await db.delete(
      'credit',
      where: 'id = ?',);}
}