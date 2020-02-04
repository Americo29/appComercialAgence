import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'graph_bar_event.dart';
part 'graph_bar_state.dart';

class GraphBarBloc extends Bloc<GraphBarEvent, GraphBarState> {
  @override
  GraphBarState get initialState => GraphBarInitial();

  @override
  Stream<GraphBarState> mapEventToState(
    GraphBarEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
