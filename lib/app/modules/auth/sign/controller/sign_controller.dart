import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/router/app_routers.dart';
import 'package:job_timer/app/models/app_status.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';
import 'sign_state.dart';

class SignController extends Cubit<SignState> {
  final AuthService _authService;
  SignController({required AuthService authService})
      : _authService = authService,
        super(SignState.initial());

  Future<void> signWithGoogle() async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: AppStatus.loading));
    try {
      await _authService.signOut();
      await _authService.signInWithGoogle();
      Modular.to.navigate(AppRouters.PROJECT_LIST);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_ABORTED_BY_USER') {
        emit(state.copyWith(status: AppStatus.error, error: 'Login cancelado'));
      } else {
        emit(state.copyWith(status: AppStatus.error, error: e.toString()));
      }
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error, error: e.toString()));
    }
  }

  Future<void> reforgedPassword({required String email}) async {
    if (state.status.isLoading) return;
    emit(state.copyWith(status: AppStatus.loading));
    try {
      await _authService.reforgedPassword(email: email);
      emit(state.copyWith(
        status: AppStatus.success,
        error: 'Enviamos um email de redefinição de senha',
      ));
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error, error: e.toString()));
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (state.status.isLoading) return;
    emit(state.copyWith(status: AppStatus.loading));
    try {
      await _authService.signOut();
      await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Modular.to.navigate(AppRouters.PROJECT_LIST);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(state.copyWith(
          status: AppStatus.error,
          error: 'Usuário não encontrado',
        ));
      } else if (e.code == 'wrong-password') {
        emit(state.copyWith(status: AppStatus.error, error: 'Senha incorreta'));
      } else {
        emit(state.copyWith(status: AppStatus.error, error: e.toString()));
      }
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error, error: e.toString()));
    }
  }
}
