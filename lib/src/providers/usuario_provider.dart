
import 'package:agencedb/src/model/usuario.dart';
import 'package:agencedb/src/providers/db_provider.dart';


class _UsuariosProvider {  

  Future<List<Usuario>> loadTableUsuario() async {
    final dataList = await DBProvider.db.getTable(0);
    final resp = Usuarios.fromJsonList(dataList);
    return resp.usuarios;
  }
}

final usuariosProvider = new _UsuariosProvider();