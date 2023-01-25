part of 'dummy_logic_bloc.dart';

abstract class DummyLogicState extends Equatable {}

class DummyLogicInitial extends DummyLogicState {
  @override
  List<Object?> get props => [];
}

class DummyLogicLoading extends DummyLogicState {
  @override
  List<Object?> get props => [];
}

class DummyLogicLoaded extends DummyLogicState {
  final List<Product> product;
  DummyLogicLoaded(this.product);
  @override
  List<Object?> get props => [product];
}

class DummyLogicFetchError extends DummyLogicState {
  final String? message;
  DummyLogicFetchError(this.message);
  @override
  List<Object?> get props => [message];
}
