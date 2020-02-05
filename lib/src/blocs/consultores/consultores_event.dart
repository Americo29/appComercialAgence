
part of 'consultores_bloc.dart';

abstract class ConsultoresEvent extends Equatable {
  const ConsultoresEvent();


  @override  
  List<Object> get props => [];

}

class AppStartedEvent extends ConsultoresEvent {}

class GetConsultoresEvent extends ConsultoresEvent {
  const GetConsultoresEvent();


  @override  
  List<Object> get props => [];

  @override
  String toString() => 'GetConsultores current.';

}

class UpdateTodo extends ConsultoresEvent {
  final PermissaoSistema updatedTodo;

  const UpdateTodo(this.updatedTodo);

  @override
  List<Object> get props => [updatedTodo];

  @override
  String toString() => 'UpdateTodo { updatedTodo: updatedTodo }';
}

class ClearCompleted extends ConsultoresEvent {}

class ToggleAll extends ConsultoresEvent {}