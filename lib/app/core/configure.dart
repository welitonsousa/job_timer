import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/router/app_routers.dart';
import 'package:job_timer/firebase_options.dart';

sealed class AppConfigure {
  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    if (FirebaseAuth.instance.currentUser == null) {
      Modular.setInitialRoute(AppRouters.SIGN_IN);
    } else {
      Modular.setInitialRoute(AppRouters.PROJECT_LIST);
    }
  }
}
