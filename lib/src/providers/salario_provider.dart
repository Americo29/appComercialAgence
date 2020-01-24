import 'package:agencedb/src/model/salario.dart';
import 'db_provider.dart';

class _SalariosProvider {
  
  Future<List<Salario>> loadTableSalario() async {
    final dataList = await DBProvider.db.getTable(1);
    final resp = Salarios.fromJsonList(dataList);
    return resp.salarios;
  }
}

final salariosProvider = new _SalariosProvider();