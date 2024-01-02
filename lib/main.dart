import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/configure.dart';
import 'app/core/app_module/app_module.dart';
import 'app/core/app_module/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfigure.initialize();

  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
