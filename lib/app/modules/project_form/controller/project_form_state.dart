import 'package:equatable/equatable.dart';
import 'package:job_timer/app/models/app_status.dart';

class ProjectFormState extends Equatable {
  final AppStatus status;
  final String? message;

  const ProjectFormState({required this.status, required this.message});

  ProjectFormState copyWith({
    AppStatus? status,
    String? message,
  }) {
    return ProjectFormState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  factory ProjectFormState.initial() {
    return const ProjectFormState(
      status: AppStatus.initial,
      message: null,
    );
  }

  @override
  List<Object?> get props => [status, message];
}
