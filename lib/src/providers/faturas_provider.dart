import 'package:agencedb/src/model/factura.dart';
import 'db_provider.dart';


class _FaturasProvider {
  
  Future<List<Fatura>> loadTableUsuario() async {
    final dataList = await DBProvider.db.getTable(0);
    final resp = Faturas.fromJsonList(dataList);
    return resp.faturas;
  }
}

final faturasProvider = new _FaturasProvider();