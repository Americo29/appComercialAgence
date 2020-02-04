import 'package:agencedb/src/model/permissao_s.dart';
import 'db_provider.dart';



class PermissaosProvider {  

  Future<List<PermissaoSistema>> loadTablePermissao() async {
    final dataList = await DBProvider.db.getTable(4);
    final resp = PermissaosSistemas.fromJsonList(dataList);
    return resp.permissaos;
  }
}

// final permissaoProvider = new _PermissaosProvider();