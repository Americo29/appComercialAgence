import 'package:agencedb/src/providers/permissaoS_provider.dart';



class AgenceRepository {

  final consultoresProvider = PermissaosProvider();

  Future<List> getConsultores() async {
    final result = await consultoresProvider.loadTablePermissao();
    // print(result);
    return result;
  }
  
}