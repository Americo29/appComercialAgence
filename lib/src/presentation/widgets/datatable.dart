import 'package:agencedb/src/model/models.dart';
import 'package:flutter/material.dart';

  double ganancia1 = 30000;
  double ganancia2 = 50000;


List<Widget> dataTable(
    BuildContext context, List<PermissaoSistema> consultores) {      

  List<Widget> data = new List<Widget>();

  if (consultores.length < 1) {
    data.add(Column(
      children: <Widget>[
        SizedBox(height: 200.0,),
        Center(child: Text('No hay consultor seleccionado...')),
      ],
    ));
  } else {
    for (var i = 0; i < consultores.length; i++) {
      data.add(
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(color: Colors.lightBlue),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Text(
                  '${consultores[i].coUsuario}',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(columns: [
                  DataColumn(label: Text('Periodo')),
                  DataColumn(label: Text('Ganancia neta')),
                  DataColumn(label: Text('Costo fijo')),
                  DataColumn(label: Text('Comisión')),
                  DataColumn(label: Text('Lucro')),
                ], rows: [
                  DataRow(cells: [
                    DataCell(Text('Janeiro de 2007')),
                    DataCell(Text('15.000,00')),
                    DataCell(Text('15.000,00')),
                    DataCell(Text('15.000,00')),
                    DataCell(Text('15.000,00')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Janeiro de 2007')),
                    DataCell(Text('15.000,00')),
                    DataCell(Text('15.000,00')),
                    DataCell(Text('15.000,00')),
                    DataCell(Text('15.000,00')),
                  ]),
                  DataRow(selected: true, cells: [
                    DataCell(Text('SALDO')),
                    DataCell(Text('${ganancia1 + ganancia2}')),
                    DataCell(Text('43.000,00')),
                    DataCell(Text('43.000,00')),
                    DataCell(Text('43.000,00')),
                  ]),
                ]),
              ),
            ],
          ),
        ),
      );
    }
  }
  return data;
}
