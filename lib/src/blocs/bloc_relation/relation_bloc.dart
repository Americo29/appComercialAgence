import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'relation_event.dart';
part 'relation_state.dart';

class RelationBloc extends Bloc<RelationEvent, RelationState> {
  @override
  RelationState get initialState => RelationInitial();

  @override
  Stream<RelationState> mapEventToState(
    RelationEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
