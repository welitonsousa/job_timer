import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/auth/register/register_page.dart';

import 'controller/register_controller.dart';

class RegisterModule extends Module {
  @override
  void binds(i) {
    i.addInstance(RegisterBloc());
  }

  @override
  void routes(r) {
    r.child('/', child: (c) => const RegisterPage());
  }
}
