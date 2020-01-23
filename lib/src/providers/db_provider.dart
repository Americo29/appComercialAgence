import 'dart:io';
import 'package:agencedb/src/model/usuarios.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';



class DBProvider {

  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {

    if(_database != null) return _database;

    _database = await initDB();

    return _database;
  }


  initDB() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join( documentsDirectory.path, 'caolDB.db' ); 

    if(FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
      
      ByteData data = await rootBundle.load(join('data', 'caol.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await new File(path).writeAsBytes(bytes);
    }

    return await openDatabase(path,version: 1,onOpen: (db){});
    

  }

  nuevoUsuario(CaoUser nuevoUser) async {
    final db = await database;

    final resp = db.insert('cao_usuario', nuevoUser.toJson());

    return resp;

  }

  Future<List<dynamic>> getAllData() async {
    
    final db = await database;
    List<Map> resp = await db.query('cao_salario');

    return resp.isNotEmpty ? resp : Null; 

  }



}