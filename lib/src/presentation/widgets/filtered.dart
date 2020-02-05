import 'package:agencedb/src/blocs/blocs.dart';
import 'package:agencedb/src/blocs/filtered/filtered_bloc.dart';
import 'package:agencedb/src/model/models.dart';
import 'package:agencedb/src/presentation/widgets/loading_indicator.dart';
import 'package:agencedb/src/presentation/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilteredConsultores extends StatelessWidget {
  const FilteredConsultores({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredTodosBloc, FilteredTodosState>(
      builder: (context, state) {
        if (state is FilteredTodosLoading) {
          return LoadingIndicator();
        } else if (state is FilteredTodosLoaded) {
          final todos = state.filteredTodos;
          return tableTodos(context, todos);
          // return ListView.builder(
          //   itemCount: todos.length,
          //   itemBuilder: (BuildContext context, int index){
          //     final todo = todos[index];
          //     return Column(
          //       children: <Widget>[
          //         TodoItem(
          //           onTap: (){},
          //           consultoresPS: todo,
          //           onCheckboxChanged: (_){
          //             BlocProvider.of<ConsultoresBloc>(context).add(
          //               UpdateTodo(todo.copyWith(filtered: !todo.filtered)),
          //             );
          //           }
          //         ),
          //         Divider(height: 1.0,),
          //       ],
          //     );
          //   },
          // );
        } else {
          return Container();
        }
      },
    );
  }

  Widget tableTodos(BuildContext context, List<PermissaoSistema> todos) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(1.0),
        width: MediaQuery.of(context).size.width * 0.9,
        child: DataTable(
          dataRowHeight: 50.0,
          horizontalMargin: 10.0,
          columns: [
            DataColumn(
              label: Text(
                'Consultores',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
          rows: todos
              .map(
                (consultor) => DataRow(
                  cells: [
                    DataCell(
                      TodoItem(
                        onTap: () {},
                        consultoresPS: consultor,
                        onCheckboxChanged: (_) {
                          BlocProvider.of<ConsultoresBloc>(context).add(
                            UpdateTodo(consultor.copyWith(
                              filtered: !consultor.filtered),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
