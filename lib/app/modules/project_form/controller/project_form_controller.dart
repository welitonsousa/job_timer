import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/entities/project_entity.dart';
import 'package:job_timer/app/models/app_status.dart';
import 'package:job_timer/app/models/project_model.dart';
import 'package:job_timer/app/services/projects/projects_service.dart';

import 'project_form_state.dart';

class ProjectFormController extends Cubit<ProjectFormState> {
  final ProjectService _projectService;

  ProjectFormController(this._projectService)
      : super(ProjectFormState.initial());

  Future<void> register({required String name, required int estimate}) async {
    try {
      emit(state.copyWith(status: AppStatus.loading));
      final project = ProjectModel(
        id: 0,
        name: name,
        estimate: estimate,
        status: ProjectStatus.IN_PROGRESS,
        tasks: [],
      );
      await _projectService.register(project);
      emit(state.copyWith(status: AppStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: AppStatus.error,
        message: 'Erro ao criar projeto',
      ));
    }
  }
}
