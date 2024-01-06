import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/router/app_routers.dart';
import 'package:job_timer/app/entities/project_entity.dart';
import 'package:job_timer/app/modules/project_list/controller/project_list_controller.dart';

class ProjectHeaderActions extends StatelessWidget {
  final ProjectListController controller;

  const ProjectHeaderActions({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: context.theme.scaffoldBackgroundColor,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownMenu<ProjectStatus>(
                width: context.width,
                expandedInsets: const EdgeInsets.all(8),
                inputDecorationTheme: const InputDecorationTheme(
                  border: InputBorder.none,
                ),
                initialSelection: controller.state.projectStatus,
                dropdownMenuEntries: ProjectStatus.values.map((e) {
                  return DropdownMenuEntry(value: e, label: e.label);
                }).toList(),
                onSelected: (v) {
                  controller.changeFilter(v!);
                },
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: FastButton(
              label: 'Novo projeto',
              onPressed: () async {
                final res = await Modular.to.pushNamed(AppRouters.PROJECT_FORM);
                if (res == true) await controller.initialize();
              },
            ),
          ),
        ],
      ),
    );
  }
}
