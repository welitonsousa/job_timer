import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/database/database_impl.dart';
import 'package:job_timer/app/core/router/app_routers.dart';
import 'package:job_timer/app/modules/auth/register/register_module.dart';
import 'package:job_timer/app/modules/auth/sign/sign_module.dart';
import 'package:job_timer/app/modules/project_list/project_list_module.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';
import 'package:job_timer/app/services/auth/auth_service_impl.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<Database>(DatabaseImpl.new);
    i.addSingleton<AuthService>(AuthServiceImpl.new);
  }

  @override
  void routes(r) {
    r.module(AppRouters.REGISTER, module: RegisterModule());
    r.module(AppRouters.SIGN_IN, module: SignModule());
    r.module('/', module: ProjectListModule());
  }
}
