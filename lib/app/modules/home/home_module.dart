import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/router/app_routers.dart';
import 'package:job_timer/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(r) {
    r.child(AppRouters.HOME, child: (c) => const HomePage());
  }
}
