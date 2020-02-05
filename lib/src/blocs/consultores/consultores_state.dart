part of 'consultores_bloc.dart';


abstract class ConsultoresState extends Equatable {
  const ConsultoresState();

  @override  
  List<Object> get props => [];

}

class ConsultoresInitialState extends ConsultoresState {}

class ConsultoresUninitializedState extends ConsultoresState {}

class ConsultoresInitializedState extends ConsultoresState {
  final List<PermissaoSistema> datalist;

  const ConsultoresInitializedState([this.datalist = const []]);

  @override
  String toString() => 'ConsultoresInitializedState';
}

class TodosLoaded extends ConsultoresState {
  final List<PermissaoSistema> todos;

  const TodosLoaded([this.todos = const []]);

  @override  
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosLoaded { todos: todos }';
}

class ConsultoresLoadingState extends ConsultoresState {}

class ConsultoresFilteringState extends ConsultoresState {}

class ConsultoresFailureState extends ConsultoresState {
  final String error;

  const ConsultoresFailureState({@required this.error});

  @override
  String toString() => 'ConsultoresFailureState { error: $error }';
}