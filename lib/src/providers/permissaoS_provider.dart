import 'package:agencedb/src/model/permissao_s.dart';
import 'db_provider.dart';



class _PermissaosProvider {  

  Future<List<PermissaoSistema>> loadTableUsuario() async {
    final dataList = await DBProvider.db.getTable(0);
    final resp = PermissaosSistemas.fromJsonList(dataList);
    return resp.permissaos;
  }
}

final usuariosProvider = new _PermissaosProvider();