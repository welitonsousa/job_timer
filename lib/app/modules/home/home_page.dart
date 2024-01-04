import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:isar/isar.dart';
import 'package:job_timer/app/core/constants/app_images.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/database/database_impl.dart';
import 'package:job_timer/app/entities/project_entity.dart';
import 'package:job_timer/app/modules/home/widgets/home_filter_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Image.asset(AppImages.LOGO),
                ),
              ),
              title: const Text('Projetos'),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: HomeFilterHeader(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  FastButton(
                      label: 'GET',
                      onPressed: () async {
                        final isar = await Modular.get<Database>().i;
                        final projects = isar.collection<ProjectEntity>();
                        final allRecipes =
                            await isar.projectEntitys.where().findAll();
                        print(allRecipes);
                      }),
                  FastButton(
                    label: 'CREATE',
                    onPressed: () async {
                      final isar = await Modular.get<Database>().i;
                      final a = ProjectEntity()..name = 'Pancakes';

                      await isar.writeTxn(() async {
                        await isar.projectEntitys.put(a);
                      });
                    },
                  ),
                  // Container(
                  //   height: 1000,
                  //   color: Colors.green,
                  // ),
                  // Container(
                  //   height: 1000,
                  //   color: Colors.orange,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
