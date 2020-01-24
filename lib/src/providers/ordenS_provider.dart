import 'package:agencedb/src/model/orden_s.dart';
import 'db_provider.dart';


class _OrdenServicioProvider {  

  Future<List<OrdenServicio>> loadTableOrdenServicio() async {
    final dataList = await DBProvider.db.getTable(3);
    final resp = OrdenesServicio.fromJsonList(dataList);
    return resp.ordenesServicio;
  }
}

final ordenServicioProvider = new _OrdenServicioProvider();