part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadData extends HomeEvent {
  const LoadData();
  @override
  List<Object> get props => [];
}

class LoadMoreData extends HomeEvent {
  final String url;
  const LoadMoreData({required this.url});
  @override
  List<Object> get props => [];
}
