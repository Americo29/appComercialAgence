import 'package:agencedb/src/blocs/blocs.dart';
import 'package:agencedb/src/blocs/filtered/filtered_bloc.dart';
import 'package:agencedb/src/presentation/widgets/loading_indicator.dart';
import 'package:agencedb/src/presentation/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class FilteredConsultores extends StatelessWidget {

  const FilteredConsultores({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredTodosBloc, FilteredTodosState>(
      builder: (context, state){
        if (state is FilteredTodosLoading) {
          return LoadingIndicator();
        } else if (state is FilteredTodosLoaded) {
          final todos = state.filteredTodos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index){
              final todo = todos[index];
              return TodoItem(
                onTap: (){},
                consultoresPS: todo, 
                onCheckboxChanged: (_){
                  BlocProvider.of<ConsultoresBloc>(context).add(
                    UpdateTodo(todo.copyWith(filtered: !todo.filtered)),
                  );
                }
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}