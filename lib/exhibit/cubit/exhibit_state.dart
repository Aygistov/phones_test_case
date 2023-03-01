part of 'exhibit_cubit.dart';

class ExhibitState extends Equatable {
  const ExhibitState(this.exhibits);

  final List<Exhibit> exhibits;

  @override
  List<Object> get props => [exhibits];
}

class ExhibitInitial extends ExhibitState {
  const ExhibitInitial(super.exhibits);
}
