import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/auth/register/controller/register_state.dart';

import 'controller/register_controller.dart';

class RegisterPage extends StatefulWidget {
  final RegisterController controller;
  const RegisterPage({super.key, required this.controller});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      bloc: widget.controller,
      listener: (context, state) {
        if (state.status.isError) {
          context.showMessage(state.error!, type: MessageVariant.error);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Cadastrar conta')),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              FastFormField(
                label: 'Email',
                controller: _emailController,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: Zod().required().email().build,
              ),
              const SizedBox(height: 10),
              FastFormField(
                label: 'Senha',
                controller: _passwordController,
                isPassword: true,
                textInputAction: TextInputAction.next,
                validator: Zod().required().min(8).build,
              ),
              const SizedBox(height: 10),
              FastFormField(
                label: 'Confirmar Senha',
                isPassword: true,
                controller: _confirmPasswordController,
                validator: (v) =>
                    Zod().equals(_passwordController.text).build(v),
              ),
              const SizedBox(height: 10),
              FastButton(
                label: 'Criar conta',
                loading: widget.controller.state.status.isLoading,
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  widget.controller.register(
                    email: _emailController.text,
                    password: _passwordController.text,
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
