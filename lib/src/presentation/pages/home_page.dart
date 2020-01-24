import 'package:agencedb/src/model/permissao_s.dart';
import 'package:agencedb/src/model/salario.dart';
import 'package:agencedb/src/model/usuario.dart';
import 'package:agencedb/src/providers/permissaoS_provider.dart';
import 'package:agencedb/src/providers/usuario_provider.dart';
import 'package:flutter/material.dart';




class HomePage extends StatelessWidget {
static const String routeName = 'home';
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agence home'),
      ),
      body: _lista(),
    );
  }

  Widget _lista(){
        
    return FutureBuilder(
      future: permissaoProvider.loadTablePermissao(),     
      builder: (BuildContext context, AsyncSnapshot<List<PermissaoSistema>> snapshot) {
        if(snapshot.hasData){
          // print(snapshot.data[]);
          return ListView( children: _listItem(snapshot.data, context)
          );
          // return ListView.builder(
          //   itemCount: snapshot.data.length,
          //   itemBuilder: (BuildContext context, int index) {
          //   return ListTile(
          //     title: Text('${snapshot.data[index].co_usuario}'),
          //   );
          //  },
          // );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        
      },
    );

  }

  List<Widget> _listItem(List<PermissaoSistema> data, BuildContext context){

    final List<Widget> opciones = [];

      data.forEach((opt){

      final widgetTemp = ListTile(
        title: Text('${opt.coUsuario}'),
        // subtitle: Text('${opt.nuCep}'),
        // leading: Icon(Icons.data_usage),
        // trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: (){},

      );

      opciones..add(widgetTemp)
              ..add(Divider());

    });

    return opciones;
    
  }

}