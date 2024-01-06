import 'package:flutter_modular/flutter_modular.dart';
import 'controller/project_form_controller.dart';
import './project_form_page.dart';

class ProjectFormModule extends Module {
  @override
  void binds(i) {
    i.addInstance(ProjectFormController.new);
  }

  @override
  void routes(r) => [
        r.child(
          '/',
          child: (context) => ProjectFormPage(controller: Modular.get()),
        ),
      ];
}
