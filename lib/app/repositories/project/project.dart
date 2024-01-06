import '../../entities/project_entity.dart';

abstract class ProjectRepository {
  Future<int> register(ProjectEntity project);
  Future<List<ProjectEntity>> loadAllProjects();
}
