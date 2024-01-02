import 'package:equatable/equatable.dart';
import 'package:job_timer/app/models/app_status.dart';

class RegisterState extends Equatable {
  final AppStatus status;
  final String? error;

  const RegisterState({required this.status, this.error});

  RegisterState copyWith({AppStatus? status, String? error}) {
    return RegisterState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  factory RegisterState.initial() {
    return const RegisterState(status: AppStatus.initial);
  }

  @override
  List<Object?> get props => [status, error];
}
