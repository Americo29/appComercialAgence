import 'package:agencedb/src/model/permissao_s.dart';
import 'package:flutter/material.dart';



class TodoItem extends StatelessWidget {

  final PermissaoSistema consultoresPS;
  final ValueChanged<bool> onCheckboxChanged;
  final GestureTapCallback onTap;


  TodoItem({
    @required this.onTap,
    @required this.consultoresPS,
    @required this.onCheckboxChanged,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ListTile(
      onTap: onTap,
      leading: Checkbox(
        // key: Key(consultoresPS.coUsuario),
        value: consultoresPS.filtered, 
        onChanged: onCheckboxChanged
      ),
      title: Hero(
        tag: '${consultoresPS.coUsuario}', 
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            consultoresPS.coUsuario,
            style: Theme.of(context).textTheme.title
          ),
        )
      ),
      subtitle: Text(consultoresPS.coUsuarioAtualizacao)
    );
  }
}