import 'dart:async';

import 'package:agencedb/src/model/permissao_s.dart';
import 'package:agencedb/src/repositories/agence_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';

part 'consultores_event.dart';
part 'consultores_state.dart';

class ConsultoresBloc extends Bloc<ConsultoresEvent, ConsultoresState> {
  final AgenceRepository agenceRepository;

  ConsultoresBloc({@required this.agenceRepository})
        : assert(agenceRepository != null);

  @override
  ConsultoresState get initialState => ConsultoresUninitializedState();

  @override
  Stream<ConsultoresState> mapEventToState(ConsultoresEvent event) async* {

    if (event is AppStartedEvent) {
      yield* _mapLoadConsultoresState();
    } else if (event is UpdateTodo) {
      yield* _mapUpdateTodoToState(event);
    } else if (event is ToggleAll) {
      yield* _mapToggleAllToState();
    } else if (event is ClearCompleted) {
      yield* _mapClearCompletedToState();
    }
    
  }

  Stream<ConsultoresState> _mapLoadConsultoresState() async* {
    try {
      yield ConsultoresLoadingState();
      final List<PermissaoSistema> result = await agenceRepository.getConsultores();
      yield TodosLoaded(result);
    } catch (e) {
      yield ConsultoresFailureState(error: e);
    }
  }

  Stream<ConsultoresState> _mapUpdateTodoToState(UpdateTodo event) async* {
    if (state is TodosLoaded) {      
      final List<PermissaoSistema> updatedTodos = (state as TodosLoaded).todos.map(
        (todo) {         
          if(todo.coUsuario == event.updatedTodo.coUsuario){             
            return event.updatedTodo;
          }else{             
            return todo;
          }
        }
      ).toList();
      yield TodosLoaded(updatedTodos);
      // _saveTodos(updatedTodos);
    }
  }

  Stream<ConsultoresState> _mapToggleAllToState() async* {
    if (state is TodosLoaded) {
      final allComplete =
          (state as TodosLoaded).todos.every((todo) => todo.filtered);
      final List<PermissaoSistema> updatedTodos = (state as TodosLoaded)
          .todos
          .map((todo) => todo.copyWith(filtered: !allComplete))
          .toList();
      yield TodosLoaded(updatedTodos);
      // _saveTodos(updatedTodos);
    }
  }

  Stream<ConsultoresState> _mapClearCompletedToState() async* {
    if (state is TodosLoaded) {
      final List<PermissaoSistema> updatedTodos =
          (state as TodosLoaded).todos.where((todo) => !todo.filtered).toList();
      yield TodosLoaded(updatedTodos);
      // _saveTodos(updatedTodos);
    }
  }

}
