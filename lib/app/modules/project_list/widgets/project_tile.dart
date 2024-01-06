import 'package:flutter/material.dart';
import 'package:job_timer/app/models/project_model.dart';

class ProjectTile extends StatefulWidget {
  final ProjectModel project;
  const ProjectTile({super.key, required this.project});

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {
  @override
  void didUpdateWidget(covariant ProjectTile oldWidget) {
    calcPercent();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    calcPercent();
    super.initState();
  }

  double percent = 0;
  bool redLine = false;
  void calcPercent() {
    final total = widget.project.tasks.fold<int>(0, (p, e) => p + e.duration);
    if (total > 0) percent = total / widget.project.estimate;
    if (percent > 1) redLine = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 90),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(child: Text(widget.project.name)),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: percent,
                  minHeight: 5,
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                  valueColor: redLine
                      ? const AlwaysStoppedAnimation<Color>(Colors.red)
                      : null,
                ),
              ),
              const SizedBox(width: 10),
              Text('${widget.project.estimate}H')
            ],
          ),
        ],
      ),
    );
  }
}
