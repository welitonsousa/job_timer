import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/auth/sign/controller/sign_controller.dart';
import 'package:job_timer/app/modules/auth/sign/sign_page.dart';

class SignModule extends Module {
  @override
  void binds(i) {
    i.addInstance(SignController(authService: Modular.get()));
  }

  @override
  void routes(r) {
    r.child('/', child: (c) => SignPage(controller: Modular.get()));
  }
}
