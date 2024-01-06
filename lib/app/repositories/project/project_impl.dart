import 'package:isar/isar.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/entities/project_entity.dart';

import 'project.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  final Database _database;

  ProjectRepositoryImpl(this._database);

  @override
  Future<int> register(ProjectEntity project) async {
    final isar = await _database.i;
    return await isar.writeTxn<int>(() async {
      final id = await isar.projectEntitys.put(project);
      return id;
    });
  }

  @override
  Future<List<ProjectEntity>> loadAllProjects() async {
    final isar = await _database.i;
    return isar.projectEntitys.where().findAll();
  }
}
