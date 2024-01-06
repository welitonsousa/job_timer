import 'package:job_timer/app/entities/project_entity.dart';
import 'package:job_timer/app/models/project_model.dart';
import 'package:job_timer/app/repositories/project/project.dart';
import 'projects_service.dart';

class ProjectServiceImpl extends ProjectService {
  final ProjectRepository _projectRepository;

  ProjectServiceImpl(this._projectRepository);

  @override
  Future<ProjectModel> register(ProjectModel project) async {
    final entity = ProjectEntity()
      ..estimate = project.estimate
      ..name = project.name;

    final id = await _projectRepository.register(entity);
    project.id = id;
    return project;
  }

  @override
  Future<List<ProjectModel>> loadAllProjects() async {
    final res = await _projectRepository.loadAllProjects();
    return res.map((e) => ProjectModel.fromEntity(e)).toList();
  }
}
