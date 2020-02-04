
class PermissaosSistemas{

  List<PermissaoSistema> permissaos = new List();
  
  PermissaosSistemas.fromJsonList(List<dynamic> jsonList){

    if( jsonList == null ) return;

    jsonList.forEach((item){
      final permissao = PermissaoSistema.fromJson(item);
      permissaos.add(permissao);
    });
  }
}



class PermissaoSistema {
  bool filtered;
  String coUsuario;
  int coTipoUsuario;
  int coSistema;
  String inAtivo;
  String coUsuarioAtualizacao;
  String dtAtualizacao;

  PermissaoSistema({
    this.filtered = false,
    this.coUsuario,
    this.coTipoUsuario,
    this.coSistema,
    this.inAtivo,
    this.coUsuarioAtualizacao,
    this.dtAtualizacao,
  });

  factory PermissaoSistema.fromJson(Map<String, dynamic> json) => PermissaoSistema(

    coUsuario             : json["co_usuario"],
    coTipoUsuario         : json["co_tipo_usuario"],
    coSistema             : json["co_sistema"],
    inAtivo               : json["in_ativo"],
    coUsuarioAtualizacao  : json["co_usuario_atualizacao"],
    dtAtualizacao         : json["dt_atualizacao"],

  );

  Map<String, dynamic> toJson() => {

    "co_usuario"              : coUsuario,
    "co_tipo_usuario"         : coTipoUsuario,
    "co_sistema"              : coSistema,
    "in_ativo"                : inAtivo,
    "co_usuario_atualizacao"  : coUsuarioAtualizacao,
    "dt_atualizacao"          : dtAtualizacao,

  };

  PermissaoSistema copyWith({ bool filtered, String coUsuario, int coTipoUsuario, int coSistema, String inAtivo, String coUsuarioAtualizacao, String dtAtualizacao,}){
    return PermissaoSistema(
      filtered: filtered ?? this.filtered,
      coUsuario: coUsuario ?? this.coUsuario,
      coTipoUsuario: coTipoUsuario ?? this.coTipoUsuario,
      coSistema: coSistema ?? this.coSistema,
      inAtivo: inAtivo ?? this.inAtivo,
      coUsuarioAtualizacao: coUsuarioAtualizacao ?? this.coUsuarioAtualizacao,
      dtAtualizacao: dtAtualizacao ?? this.dtAtualizacao,
    );
  }

}