import 'package:isar/isar.dart';
import 'package:job_timer/app/entities/project_entity.dart';
import 'package:job_timer/app/entities/project_task_entity.dart';
import 'package:path_provider/path_provider.dart';

import 'database.dart';

class DatabaseImpl implements Database {
  static Isar? _instance;

  @override
  Future<Isar> get i async {
    if (_instance == null) {
      final dir = await getApplicationSupportDirectory();

      _instance = await Isar.open(
        [ProjectTaskEntitySchema, ProjectEntitySchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return _instance!;
  }
}
