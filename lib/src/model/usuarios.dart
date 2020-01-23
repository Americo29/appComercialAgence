

class Usuarios{

  List<CaoUser> caousers = new List();


  Usuarios.fromJsonList(List<dynamic> jsonList){

    if( jsonList == null ) return;

    jsonList.forEach((item){
      final user = CaoUser.fromJson(item);
      caousers.add(user);
    });
  }
}




class CaoUser {

  String co_usuario;
  String no_usuario;
  String ds_senha;
  String co_usuario_autorizacao;
  String nu_matricula;
  String dt_nascimento;
  String dt_admissao_empresa;
  String dt_desligamento;
  String dt_inclusao;
  String dt_expiracao;
  String nu_cpf;
  String nu_rg;
  String no_orgao_emissor;
  String uf_orgao_emissor;
  String ds_endereco;
  String no_email;
  String no_email_pessoal;
  String nu_telefone;
  String dt_alteracao;
  String url_foto;
  String instant_messenger;
  String icq;
  String msn;
  String yms;
  String ds_comp_end;
  String ds_bairro;
  String nu_cep;
  String no_cidade;
  String uf_cidade;
  String dt_expedicao;

  CaoUser({
    this.co_usuario,
    this.no_usuario,
    this.ds_senha,
    this.co_usuario_autorizacao,
    this.nu_matricula,
    this.dt_nascimento,
    this.dt_admissao_empresa,
    this.dt_desligamento,
    this.dt_inclusao,
    this.dt_expiracao,
    this.nu_cpf,
    this.nu_rg,
    this.no_orgao_emissor,
    this.uf_orgao_emissor,
    this.ds_endereco,
    this.no_email,
    this.no_email_pessoal,
    this.nu_telefone,
    this.dt_alteracao,
    this.url_foto,
    this.instant_messenger,
    this.icq,
    this.msn,
    this.yms,
    this.ds_comp_end,
    this.ds_bairro,
    this.nu_cep,
    this.no_cidade,
    this.uf_cidade,
    this.dt_expedicao,
  });

  factory CaoUser.fromJson(Map<String, dynamic> json) => CaoUser(
    co_usuario              : json["co_usuario"],
    no_usuario              : json["no_usuario"],
    ds_senha                : json["ds_senha"],
    co_usuario_autorizacao  : json["co_usuario_autorizacao"],
    nu_matricula            : json["nu_matricula"],
    dt_nascimento           : json["dt_nascimento"],
    dt_admissao_empresa     : json["dt_admissao_empresa"],
    dt_desligamento         : json["dt_desligamento"],
    dt_inclusao             : json["dt_inclusao"],
    dt_expiracao            : json["dt_expiracao"],
    nu_cpf                  : json["nu_cpf"],
    nu_rg                   : json["nu_rg"],
    no_orgao_emissor        : json["no_orgao_emissor"],
    uf_orgao_emissor        : json["uf_orgao_emissor"],
    ds_endereco             : json["ds_endereco"],
    no_email                : json["no_email"],
    no_email_pessoal        : json["no_email_pessoal"],
    nu_telefone             : json["nu_telefone"],
    dt_alteracao            : json["dt_alteracao"],
    url_foto                : json["url_foto"],
    instant_messenger       : json["instant_messenger"],
    icq                     : json["icq"],
    msn                     : json["msn"],
    yms                     : json["yms"],
    ds_comp_end             : json["ds_comp_end"],
    ds_bairro               : json["ds_bairro"],
    nu_cep                  : json["nu_cep"],
    no_cidade               : json["no_cidade"],
    uf_cidade               : json["uf_cidade"],
    dt_expedicao            : json["dt_expedicao"],
  );

  Map<String, dynamic> toJson() => {

      "co_usuario"              : co_usuario,
      "no_usuario"              : no_usuario,
      "ds_senha"                : ds_senha,
      "co_usuario_autorizacao"  : co_usuario_autorizacao,
      "nu_matricula"            : nu_matricula,
      "dt_nascimento"           : dt_nascimento,
      "dt_admissao_empresa"     : dt_admissao_empresa,
      "dt_desligamento"         : dt_desligamento,
      "dt_inclusao"             : dt_inclusao,
      "dt_expiracao"            : dt_expiracao,
      "nu_cpf"                  : nu_cpf,
      "nu_rg"                   : nu_rg,
      "no_orgao_emissor"        : no_orgao_emissor,
      "uf_orgao_emissor"        : uf_orgao_emissor,
      "ds_endereco"             : ds_endereco,
      "no_email"                : no_email,
      "no_email_pessoal"        : no_email_pessoal,
      "nu_telefone"             : nu_telefone,
      "dt_alteracao"            : dt_alteracao,
      "url_foto"                : url_foto,
      "instant_messenger"       : instant_messenger,
      "icq"                     : icq,
      "msn"                     : msn,
      "yms"                     : yms,
      "ds_comp_end"             : ds_comp_end,
      "ds_bairro"               : ds_bairro,
      "nu_cep"                  : nu_cep,
      "no_cidade"               : no_cidade,
      "uf_cidade"               : uf_cidade,
      "dt_expedicao"            : dt_expedicao,
      
  };


}