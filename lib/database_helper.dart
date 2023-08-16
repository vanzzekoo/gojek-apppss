// lib/database_helper.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Buat singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  late Database _database;

  // Fungsi untuk membuka database
  Future<void> openDatabase() async {
    // Implementasi pembukaan database
  }

  // Fungsi untuk menyimpan data Driver
  Future<int> saveDriverData(Map<String, dynamic> driverData) async {
    await openDatabase();
    return await _database.insert('driver', driverData);
  }

  // Fungsi untuk mengambil data Driver
  Future<Map<String, dynamic>> getDriverData() async {
    await openDatabase();
    List<Map<String, dynamic>> results = await _database.query('driver');
    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  // Fungsi untuk menyimpan data pengiriman
  Future<int> savePackageData(Map<String, dynamic> packageData) async {
    await openDatabase();
    return await _database.insert('package', packageData);
  }

  // Fungsi untuk mengambil data pengiriman berdasarkan tanggal
  Future<List<Map<String, dynamic>>> getPackageHistory(DateTime date) async {
    await openDatabase();
    List<Map<String, dynamic>> results = await _database.query(
      'package',
      where: 'tanggal = ?',
      whereArgs: [date.toIso8601String()],
    );
    return results;
  }
}
