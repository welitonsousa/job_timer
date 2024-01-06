import 'package:job_timer/app/entities/project_entity.dart';

import 'project_task_model.dart';

class ProjectModel {
  int? id;
  final String name;
  final int estimate;
  final ProjectStatus status;
  final List<ProjectTaskModel> tasks;

  ProjectModel({
    required this.id,
    required this.name,
    required this.estimate,
    required this.status,
    required this.tasks,
  });

  factory ProjectModel.fromEntity(ProjectEntity entity) {
    entity.tasks.loadSync();

    return ProjectModel(
      id: entity.id,
      name: entity.name,
      estimate: entity.estimate,
      status: entity.status,
      tasks: entity.tasks.map(ProjectTaskModel.fromEntity).toList(),
    );
  }
}
