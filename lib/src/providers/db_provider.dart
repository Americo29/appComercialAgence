import 'dart:io';
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

  Future<List<dynamic>> getTable(int option) async {
    
    List<Map> resp = [];    
    final db = await database;

    switch (option) {
      case 0:
        resp = await db.query('cao_usuario');
        break;
      case 1:
        resp = await db.query('cao_salario');
        break;
      case 2:
        resp = await db.query('cao_fatura');
        break;
      case 3:
        resp = await db.query('cao_os');
        break;
      case 4:                      
        resp = await db.rawQuery('SELECT * FROM permissao_sistema INNER JOIN cao_usuario ON permissao_sistema.co_usuario = cao_usuario.co_usuario WHERE (co_tipo_usuario IN (?, ?, ?) AND in_ativo IN (?) AND co_sistema IN (?))', ['0', '1', '2', 'S', '1']);
        break;
      default:
    }
    return resp.isNotEmpty ? resp : Null; 
  }

}