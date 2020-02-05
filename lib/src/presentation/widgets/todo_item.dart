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
          // alignment: Alignment.topLeft,
          // width: MediaQuery.of(context).size.width,
          child: Text(
            consultoresPS.coUsuario,
             style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0,
                  color: Colors.black87
                ), 
          ),
        )
      ),
      // subtitle: Text(consultoresPS.coUsuarioAtualizacao)
    );
  }
}