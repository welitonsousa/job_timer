import 'package:isar/isar.dart';

part 'project_task_entity.g.dart';

@collection
class ProjectTaskEntity {
  Id? id = Isar.autoIncrement;
  late String name;
  late int duration;
  DateTime createdAt = DateTime.now();
}
