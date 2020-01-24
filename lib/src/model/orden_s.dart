
class OrdenesServicio{

  List<OrdenServicio> ordenesServicio = new List();
  
  OrdenesServicio.fromJsonList(List<dynamic> jsonList){

    if( jsonList == null ) return;

    jsonList.forEach((item){
      final ordenS = OrdenServicio.fromJson(item);
      ordenesServicio.add(ordenS);
    });
  }
}




class OrdenServicio {

  int coOs;
  int nuOs;
  int coSistema;
  String coUsuario;
  int coArquitetura;
  String dsOs;
  String dsCaracteristica;
  String dsRequisito;
  int dtInicio;
  int dtFim;
  int coStatus;
  String diretoriaSol;
  int dtSol;
  String nuTelSol;
  String dddTelSol;
  String nuTelSol2;
  String dddTelSol2;
  String usuarioSol;
  int dtImp;
  int dtGarantia;
  int coEmail;
  int coOsProspectRel;

  OrdenServicio({
    this.coOs,
    this.nuOs,
    this.coSistema,
    this.coUsuario,
    this.coArquitetura,
    this.dsOs,
    this.dsCaracteristica,
    this.dsRequisito,
    this.dtInicio,
    this.dtFim,
    this.coStatus,
    this.diretoriaSol,
    this.dtSol,
    this.nuTelSol,
    this.dddTelSol,
    this.nuTelSol2,
    this.dddTelSol2,
    this.usuarioSol,
    this.dtImp,
    this.dtGarantia,
    this.coEmail,
    this.coOsProspectRel,
  });

  factory OrdenServicio.fromJson(Map<String, dynamic> json) => OrdenServicio (

    coOs              : json["co_os"],
    nuOs              : json["nu_os"],
    coSistema         : json["co_sistema"],
    coUsuario         : json["co_usuario"],
    coArquitetura     : json["co_arquitetura"],
    dsOs              : json["ds_os"],
    dsCaracteristica  : json["ds_caracteristica"],
    dsRequisito       : json["ds_requisito"],
    dtInicio          : json["dt_inicio"],
    dtFim             : json["dt_fim"],
    coStatus          : json["co_status"],
    diretoriaSol      : json["diretoria_sol"],
    dtSol             : json["dt_sol"],
    nuTelSol          : json["nu_tel_sol"],   
    dddTelSol         : json["ddd_tel_sol"],
    nuTelSol2         : json["nu_tel_sol2"],
    dddTelSol2        : json["ddd_tel_sol2"],
    usuarioSol        : json["usuario_sol"],
    dtImp             : json["dt_imp"],
    dtGarantia        : json["dt_garantia"],
    coEmail           : json["co_email"],
    coOsProspectRel   : json["co_os_prospect_rel"],

  );

  Map<String, dynamic> toJson() => {
    "co_os"               : coOs,
    "nu_os"               : nuOs,
    "co_sistema"          : coSistema,
    "co_usuario"          : coUsuario,
    "co_arquitetura"      : coArquitetura,
    "ds_os"               : dsOs,
    "ds_caracteristica"   : dsCaracteristica,
    "ds_requisito"        : dsRequisito,
    "dt_inicio"           : dtInicio,
    "dt_fim"              : dtFim,
    "co_status"           : coStatus,
    "diretoria_sol"       : diretoriaSol,
    "dt_sol"              : dtSol,
    "nu_tel_sol"          : nuTelSol,
    "ddd_tel_sol"         : dddTelSol,
    "nu_tel_sol2"         : nuTelSol2,
    "ddd_tel_sol2"        : dddTelSol2,
    "usuario_sol"         : usuarioSol,
    "dt_imp"              : dtImp,
    "dt_garantia"         : dtGarantia,
    "co_email"            : coEmail,
    "co_os_prospect_rel"  : coOsProspectRel,
  };



}