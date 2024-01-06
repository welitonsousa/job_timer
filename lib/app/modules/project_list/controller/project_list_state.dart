import 'package:equatable/equatable.dart';
import 'package:job_timer/app/entities/project_entity.dart';
import 'package:job_timer/app/models/app_status.dart';
import 'package:job_timer/app/models/project_model.dart';

class ProjectListState extends Equatable {
  final AppStatus status;
  final String? message;
  final ProjectStatus projectStatus;
  final List<ProjectModel> projects;

  List<ProjectModel> get filteredProjects {
    if (projectStatus == ProjectStatus.ALL) return projects;
    return projects.where((p) => p.status == projectStatus).toList();
  }

  const ProjectListState({
    required this.status,
    required this.message,
    required this.projectStatus,
    required this.projects,
  });

  ProjectListState copyWith({
    AppStatus? status,
    String? message,
    ProjectStatus? projectStatus,
    List<ProjectModel>? projects,
  }) {
    return ProjectListState(
      status: status ?? this.status,
      message: message ?? this.message,
      projectStatus: projectStatus ?? this.projectStatus,
      projects: projects ?? this.projects,
    );
  }

  factory ProjectListState.initial() {
    return const ProjectListState(
      status: AppStatus.initial,
      message: null,
      projectStatus: ProjectStatus.ALL,
      projects: [],
    );
  }

  @override
  List<Object?> get props => [status, message, projectStatus, projects];
}
