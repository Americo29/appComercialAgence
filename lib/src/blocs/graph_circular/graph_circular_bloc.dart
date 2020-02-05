import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'graph_circular_event.dart';
part 'graph_circular_state.dart';

class GraphCircularBloc extends Bloc<GraphCircularEvent, GraphCircularState> {
  @override
  GraphCircularState get initialState => GraphCircularInitial();

  @override
  Stream<GraphCircularState> mapEventToState(
    GraphCircularEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
