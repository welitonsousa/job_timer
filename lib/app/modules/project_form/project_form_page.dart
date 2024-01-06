import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/project_form/controller/project_form_state.dart';
import 'controller/project_form_controller.dart';

class ProjectFormPage extends StatefulWidget {
  final ProjectFormController controller;

  const ProjectFormPage({super.key, required this.controller});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _estimateController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _estimateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectFormController, ProjectFormState>(
      bloc: widget.controller,
      listener: (context, state) {
        if (state.status.isSuccess) {
          context.showMessage('Projeto cadastrado com sucesso');
          Navigator.of(context).pop(true);
        } else if (state.status.isError) {
          context.showMessage(
            state.message ?? 'Ops, algo deu errado',
            type: MessageVariant.error,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Cadastro de projeto')),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              FastFormField(
                label: 'Nome',
                controller: _nameController,
                validator: Zod().required().build,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              FastFormField(
                label: 'Estimativa',
                controller: _estimateController,
                textInputType: TextInputType.number,
                validator: Zod().required().build,
                mask: [
                  Mask.generic(masks: ['######'])
                ],
              ),
              const SizedBox(height: 10),
              BlocSelector<ProjectFormController, ProjectFormState, bool>(
                bloc: widget.controller,
                selector: (state) => state.status.isLoading,
                builder: (context, loading) {
                  return FastButton(
                    label: 'Salvar',
                    loading: loading,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.controller.register(
                          name: _nameController.text,
                          estimate: int.parse(_estimateController.text),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
