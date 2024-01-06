import 'package:job_timer/app/models/project_model.dart';

abstract class ProjectService {
  Future<ProjectModel> register(ProjectModel project);
  Future<List<ProjectModel>> loadAllProjects();
}
