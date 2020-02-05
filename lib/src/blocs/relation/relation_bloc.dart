import 'dart:async';

import 'package:agencedb/src/blocs/blocs.dart';
import 'package:agencedb/src/model/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'relation_event.dart';
part 'relation_state.dart';

class RelationBloc extends Bloc<RelationEvent, RelationState> {
   final ConsultoresBloc todosBloc;
  StreamSubscription todosSubscription;

  RelationBloc({@required this.todosBloc}) {
    todosSubscription = todosBloc.listen((state) {
      if (state is TodosLoaded) {
        add(UpdateRelation(state.todos));
      }
    });
  }

  
  @override
  RelationState get initialState => RelationLoading();

  @override
  Stream<RelationState> mapEventToState( RelationEvent event) async* {
    if (event is UpdateRelation) {
      yield RelationLoading();
      List conActivos = event.todos.where((todo) => todo.filtered).toList();
      yield RelationLoaded(conActivos);
      // int numCompleted =
      //     event.todos.where((todo) => todo.filtered).toList().length;
      // yield StatsLoaded(numActive, numCompleted);
    }
  }

    @override
  Future<void> close() {
    todosSubscription.cancel();
    return super.close();
  }

}
