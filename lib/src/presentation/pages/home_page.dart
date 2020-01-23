import 'package:agencedb/src/model/usuarios.dart';
import 'package:agencedb/src/providers/usuarios_provider.dart';
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
      future: usuariosProvider.cargarData(),      
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if(snapshot.hasData){
          // print(snapshot.data.last);
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

  List<Widget> _listItem(List<dynamic> data, BuildContext context){

    final List<Widget> opciones = [];

        data.forEach((opt){

      final widgetTemp = ListTile(
        title: Text('${opt['co_usuario'].toString()}'),
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