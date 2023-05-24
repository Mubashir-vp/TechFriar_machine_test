import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:machinetest_techfriar/core/data/services/auth_services.dart';

import '../../models/usermodel.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginUser>((event, emit) async {
      try {
        emit(LoadingState());
        AuthState? state = await AuthServices().loginUser(
          pass: event.pass,
          phone: event.phone,
        );
        log("State in bloc $state");
        if (state != null) {
          emit(
            state,
          );
        }
      } catch (e) {
        log("Error occured $e");
      }
    });
  }
}
