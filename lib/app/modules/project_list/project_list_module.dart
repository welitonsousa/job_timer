import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/router/app_routers.dart';
import 'package:job_timer/app/modules/project_list/controller/project_list_controller.dart';
import 'package:job_timer/app/modules/project_list/project_list_page.dart';
import 'package:job_timer/app/modules/project_form/project_form_module.dart';
import 'package:job_timer/app/repositories/project/project.dart';
import 'package:job_timer/app/repositories/project/project_impl.dart';
import 'package:job_timer/app/services/projects/projects_service.dart';
import 'package:job_timer/app/services/projects/projects_service_impl.dart';

class ProjectListModule extends Module {
  @override
  void binds(i) {
    i.add<ProjectRepository>(ProjectRepositoryImpl.new);
    i.add<ProjectService>(ProjectServiceImpl.new);
    i.add(ProjectListController.new);
  }

  @override
  void routes(r) {
    r.child(AppRouters.PROJECT_LIST,
        child: (c) => ProjectListPage(controller: Modular.get()));
    r.module(AppRouters.PROJECT_FORM, module: ProjectFormModule());
  }
}
