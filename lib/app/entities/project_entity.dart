import 'package:isar/isar.dart';
import 'project_task_entity.dart';

part 'project_entity.g.dart';

@collection
class ProjectEntity {
  Id? id = Isar.autoIncrement;
  late String name;
  @enumerated
  final ProjectStatus status = ProjectStatus.IN_PROGRESS;
  final tasks = IsarLinks<ProjectTaskEntity>();
}

enum ProjectStatus {
  IN_PROGRESS,
  FINISHED;

  String get label {
    if (this == ProjectStatus.IN_PROGRESS) return 'Em andamento';
    return 'Finalizado';
  }
}
