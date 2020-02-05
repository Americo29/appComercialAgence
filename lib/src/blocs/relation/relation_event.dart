part of 'relation_bloc.dart';

abstract class RelationEvent extends Equatable {
  const RelationEvent();
}

class UpdateRelation extends RelationEvent {
  final List<PermissaoSistema> todos;

  const UpdateRelation(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'UpdateRelation { todos: todos }';
}