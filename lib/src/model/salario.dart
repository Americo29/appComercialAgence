
class Salarios{

  List<Salario> salarios = new List();


  Salarios.fromJsonList(List<dynamic> jsonList){

    if( jsonList == null ) return;

    jsonList.forEach((item){
      final salario = Salario.fromJson(item);
      salarios.add(salario);
    });
  }
}




class Salario {


  String coUsuario;
  int dtAlteracao;
  double brutSalario;
  double liqSalario;


  Salario({
    this.coUsuario,
    this.dtAlteracao,
    this.brutSalario,
    this.liqSalario,
  });

  factory Salario.fromJson(Map<String, dynamic> json) => Salario(
    coUsuario     : json["co_usuario"],
    dtAlteracao   : json["dt_alteracao"],  
    brutSalario   : json["brut_salario"] / 1,  
    liqSalario    : json["liq_salario"] / 1,  
  );

  Map<String, dynamic> toJson() => {
      "co_usuario"    : coUsuario,
      "dt_alteracao"  : dtAlteracao,  
      "brut_salario"  : brutSalario,  
      "liq_salario"   : liqSalario,
  };


}