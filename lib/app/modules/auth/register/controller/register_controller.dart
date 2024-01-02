import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/router/app_routers.dart';
import 'package:job_timer/app/models/app_status.dart';
import 'package:job_timer/app/modules/auth/register/controller/register_state.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';

class RegisterController extends Cubit<RegisterState> {
  final AuthService _authService;

  RegisterController({required AuthService authService})
      : _authService = authService,
        super(RegisterState.initial());

  Future<void> register(
      {required String email, required String password}) async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: AppStatus.loading));
    try {
      await _authService.createUserWithEmailAndPassword(
          email: email, password: password);
      // await _authService.signOut();
      Modular.to.navigate(AppRouters.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(state.copyWith(
          status: AppStatus.error,
          error: 'A senha é muito fraca',
        ));
      } else if (e.code == 'email-already-in-use') {
        emit(state.copyWith(
          status: AppStatus.error,
          error: 'O email já está em uso',
        ));
      } else {
        emit(state.copyWith(status: AppStatus.error, error: e.toString()));
      }
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error, error: e.toString()));
    }
  }
}
