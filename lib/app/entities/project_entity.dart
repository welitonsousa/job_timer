import 'package:isar/isar.dart';
import 'project_task_entity.dart';

part 'project_entity.g.dart';

@collection
class ProjectEntity {
  Id? id = Isar.autoIncrement;
  late String name;
  late int estimate;
  @enumerated
  final ProjectStatus status = ProjectStatus.IN_PROGRESS;
  final tasks = IsarLinks<ProjectTaskEntity>();
}

enum ProjectStatus {
  ALL,
  IN_PROGRESS,
  FINISHED;

  String get label {
    if (this == ProjectStatus.ALL) return 'Todos';
    if (this == ProjectStatus.IN_PROGRESS) return 'Em andamento';
    return 'Finalizado';
  }
}
