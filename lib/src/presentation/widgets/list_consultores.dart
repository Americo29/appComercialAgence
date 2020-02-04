// import 'package:flutter/material.dart';

// import 'package:agencedb/src/model/permissao_s.dart';
// import 'package:agencedb/src/providers/permissaoS_provider.dart';




// class ListConsultores extends StatelessWidget {
//   const ListConsultores({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }

//   Widget _lista(){
        
//     return FutureBuilder(
//       future: permissaoProvider.loadTablePermissao(),     
//       builder: (BuildContext context, AsyncSnapshot<List<PermissaoSistema>> snapshot) {
//         if(snapshot.hasData){
//           // print(snapshot.data[]);
//           return ListView( children: _listItem(snapshot.data, context)
//           );
//         }else{
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
        
//       },
//     );

//   }

//   List<Widget> _listItem(List<PermissaoSistema> data, BuildContext context){

//     final List<Widget> opciones = [];

//       data.forEach((opt){

//       final widgetTemp = ListTile(
//         title: Text('${opt.coUsuario}'),
//         // subtitle: Text('${opt.nuCep}'),
//         // leading: Icon(Icons.data_usage),
//         // trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
//         onTap: (){},

//       );

//       opciones..add(widgetTemp)
//               ..add(Divider());

//     });

//     return opciones;
    
//   }

  
// }