import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:machinetest_techfriar/core/data/services/question_services.dart';

import '../../../../core/models/questionmodel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadData>((event, emit) async {
      try {
        emit(LoadingState());
        QuestionModel? questionModel = await QuestionServices().getQuestions();
        log("State in bloc $questionModel");
        if (questionModel != null) {
          emit(
            DataLoaded(questionModel: questionModel),
          );
        }
      } catch (e) {
        log("Error occured $e");
      }
    });
    on<LoadMoreData>((event, emit) async {
      try {
        emit(LoadingState());
        QuestionModel? questionModel =
            await QuestionServices().getPaginatedQuestions(uri: event.url);
        log("State in bloc $questionModel");
        if (questionModel != null) {
          emit(
            DataLoaded(questionModel: questionModel),
          );
        }
      } catch (e) {
        log("Error occured $e");
      }
    });
  }
}
