import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/project_list/controller/project_list_controller.dart';
import 'package:job_timer/app/modules/project_list/controller/project_list_state.dart';
import 'package:job_timer/app/modules/project_list/widgets/project_filter_header.dart';
import 'package:job_timer/app/modules/project_list/widgets/project_tile.dart';

class ProjectListPage extends StatefulWidget {
  final ProjectListController controller;
  const ProjectListPage({super.key, required this.controller});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  @override
  void initState() {
    widget.controller.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: SafeArea(
        child: BlocBuilder<ProjectListController, ProjectListState>(
          bloc: widget.controller,
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                const SliverAppBar(title: Text('Projetos')),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: ProjectFilterHeader(controller: widget.controller),
                ),
                if (state.status.isSuccess && state.filteredProjects.isEmpty)
                  SliverFillRemaining(
                    child: Center(
                        child: Text(
                      'Nenhum projeto encontrado',
                      style: context.H3,
                      textAlign: TextAlign.center,
                    )),
                  ),
                if (state.status.isError)
                  SliverFillRemaining(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.message ?? 'Algo deu errado',
                            style: context.H3,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          FastButton(
                            label: 'Tentar novamente',
                            color: Colors.red,
                            variant: ButtonVariant.outlined,
                            onPressed: widget.controller.initialize,
                          )
                        ],
                      ),
                    ),
                  ),
                SliverList.builder(
                  itemCount: state.filteredProjects.length,
                  itemBuilder: (context, index) {
                    final project = state.filteredProjects[index];
                    return ProjectTile(project: project);
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
