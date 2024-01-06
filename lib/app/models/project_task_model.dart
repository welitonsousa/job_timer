import 'package:job_timer/app/entities/project_task_entity.dart';

class ProjectTaskModel {
  final int? id;
  final String name;
  final int duration;
  final DateTime createdAt;

  ProjectTaskModel({
    this.id,
    required this.name,
    required this.duration,
    required this.createdAt,
  });

  factory ProjectTaskModel.fromEntity(ProjectTaskEntity entity) {
    return ProjectTaskModel(
      id: entity.id,
      name: entity.name,
      duration: entity.duration,
      createdAt: entity.createdAt,
    );
  }
}
