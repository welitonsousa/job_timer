import 'package:flutter/material.dart';
import 'package:job_timer/app/modules/project_list/controller/project_list_controller.dart';

import 'project_header_actions.dart';

class ProjectFilterHeader extends SliverPersistentHeaderDelegate {
  final ProjectListController controller;

  ProjectFilterHeader({required this.controller});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ProjectHeaderActions(controller: controller);
  }

  @override
  double get maxExtent => 52;

  @override
  double get minExtent => 52;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
