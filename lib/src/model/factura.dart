
class Faturas{

  List<Fatura> faturas = new List();

  Faturas.fromJsonList(List<dynamic> jsonList){

    if( jsonList == null ) return;

    jsonList.forEach((item){
      final fatura = Fatura.fromJson(item);
      faturas.add(fatura);
    });
  }
}



class Fatura {

  int coFatura;
  int coCliente;
  int coSistema;
  int coOs;
  int numNf;
  double total;
  double valor;
  int dataEmissao;
  String corpoNf;
  double comissaoCn;
  double totalImpInc;
    
  Fatura({
    this.coFatura,
    this.coCliente,
    this.coSistema,
    this.coOs,
    this.numNf,
    this.total,
    this.valor,
    this.dataEmissao,
    this.corpoNf,
    this.comissaoCn,
    this.totalImpInc,
  });

  factory Fatura.fromJson(Map<String, dynamic> json) => Fatura(

    coFatura      : json["co_fatura"],
    coCliente     : json["co_cliente"],
    coSistema     : json["co_sistema"],
    coOs          : json["co_os"],
    numNf         : json["num_nf"],
    total         : json["total"],
    valor         : json["valor"],
    dataEmissao   : json["data_emissao"],
    corpoNf       : json["corpo_nf"],
    comissaoCn    : json["comissao_cn"] ,
    totalImpInc   : json["total_imp_inc"],  
  );

  Map<String, dynamic> toJson() => {
    "co_fatura"        : coFatura,          
    "co_cliente"       : coCliente,         
    "co_sistema"       : coSistema,     
    "co_os"            : coOs,  
    "num_nf"           : numNf, 
    "total"            : total, 
    "valor"            : valor, 
    "data_emissao"     : dataEmissao, 
    "corpo_nf"         : corpoNf, 
    "comissao_cn"      : comissaoCn, 
    "total_imp_inc"    : totalImpInc, 
  };


}