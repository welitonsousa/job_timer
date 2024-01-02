import 'package:equatable/equatable.dart';
import 'package:job_timer/app/models/app_status.dart';

class SignState extends Equatable {
  final AppStatus status;
  final String? error;

  const SignState({required this.status, this.error});

  factory SignState.initial() {
    return const SignState(status: AppStatus.initial);
  }

  SignState copyWith({
    AppStatus? status,
    String? error,
  }) {
    return SignState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, error];
}
