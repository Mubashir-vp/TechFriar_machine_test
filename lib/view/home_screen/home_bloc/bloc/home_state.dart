part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class LoadingState extends HomeState {}

class DataLoaded extends HomeState {
  final QuestionModel questionModel;
  const DataLoaded({
    required this.questionModel,
  });
  @override
  List<Object> get props => [questionModel];
}
