import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/entities/project_entity.dart';
import 'package:job_timer/app/models/app_status.dart';
import 'package:job_timer/app/modules/project_list/controller/project_list_state.dart';
import 'package:job_timer/app/services/projects/projects_service.dart';

class ProjectListController extends Cubit<ProjectListState> {
  final ProjectService _projectService;

  ProjectListController(this._projectService)
      : super(ProjectListState.initial());

  void changeFilter(ProjectStatus filter) {
    emit(state.copyWith(projectStatus: filter));
  }

  Future<void> initialize() async {
    try {
      emit(state.copyWith(status: AppStatus.loading));
      final res = await _projectService.loadAllProjects();
      emit(state.copyWith(status: AppStatus.success, projects: res));
    } catch (e) {
      emit(state.copyWith(
        status: AppStatus.error,
        message: 'Não foi possível carregar os projeto as as as s as ss',
      ));
    }
  }
}
