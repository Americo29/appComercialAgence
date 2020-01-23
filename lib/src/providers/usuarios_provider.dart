import 'dart:convert';

import 'package:agencedb/src/model/usuarios.dart';
import 'package:agencedb/src/providers/db_provider.dart';
import 'package:flutter/services.dart' show rootBundle;


class _UsuariosProvider {

  List<dynamic> opciones = [];

  _UsuariosProvider(){
    //
  }

  Future<List<dynamic>> cargarData() async {

    // final resp = await rootBundle.loadString('data/cao_usuario.json');

    // Map dataMap = json.decode(resp);
    // opciones = dataMap['data'];    
    
    // print(opciones[1]);
    // final user = new CaoUser.fromJson(opciones[1]);
    // print(user);
    
    // print(userJson);
    // final userT = user.caousers[1];    
    // // print(userT.toJson());
    return DBProvider.db.getAllData();

    // return opciones;

  }


}

final usuariosProvider = new _UsuariosProvider();