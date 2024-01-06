import 'package:flutter_bloc/flutter_bloc.dart';

import 'project_form_state.dart';

class ProjectFormController extends Cubit<ProjectFormState> {
  ProjectFormController() : super(ProjectFormState.initial());
}
