import 'package:flutter/material.dart';
import 'controller/project_form_controller.dart';

class ProjectFormPage extends StatefulWidget {
  final ProjectFormController controller;

  const ProjectFormPage({super.key, required this.controller});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProjectFormPage')),
      body: Container(),
    );
  }
}
