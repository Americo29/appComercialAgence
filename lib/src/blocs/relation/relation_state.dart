part of 'relation_bloc.dart';

abstract class RelationState extends Equatable {
  const RelationState();

  @override
  List<Object> get props => [];
}

class RelationLoading extends RelationState {}

class RelationLoaded extends RelationState {
  final List<PermissaoSistema> consultoresActivos;
  

  const RelationLoaded(this.consultoresActivos);

  @override
  List<Object> get props => [consultoresActivos];

  @override
  String toString() {
    return 'RelationLoaded { $consultoresActivos }';
  }
}