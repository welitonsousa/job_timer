import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/constants/app_images.dart';
import 'package:job_timer/app/core/router/app_routers.dart';
import 'package:job_timer/app/modules/auth/sign/controller/sign_controller.dart';

import 'controller/sign_state.dart';

class SignPage extends StatefulWidget {
  final SignController controller;
  const SignPage({super.key, required this.controller});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignController, SignState>(
      bloc: widget.controller,
      listener: (context, state) {
        if (state.status.isError) {
          context.showMessage(state.error!, type: MessageVariant.error);
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(padding: const EdgeInsets.all(16), children: [
            const SizedBox(height: 60),
            SizedBox(
              height: 200,
              child: Image.asset(AppImages.LOGO),
            ),
            Text(
              'Job Timer',
              style: context.H1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FastFormField(
              label: 'Email',
              controller: _emailController,
              textInputType: TextInputType.emailAddress,
              validator: Zod().required().email().min(8).build,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            FastFormField(
              label: 'Senha',
              controller: _passwordController,
              validator: Zod().required().min(8).build,
              isPassword: true,
            ),
            const SizedBox(height: 10),
            BlocBuilder(
              bloc: widget.controller,
              builder: (context, snapshot) {
                return FastButton(
                  label: 'Login',
                  loading: widget.controller.state.status.isLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.controller.signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            BlocBuilder(
              bloc: widget.controller,
              builder: (context, snapshot) {
                return FastButton(
                  label: 'Login com Google',
                  background: Colors.red,
                  loading: widget.controller.state.status.isLoading,
                  radius: 10,
                  onPressed: () {
                    widget.controller.signWithGoogle();
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              child: const Text('Criar conta'),
              onPressed: () {
                Modular.to.pushNamed(AppRouters.REGISTER);
              },
            ),
          ]),
        ),
      ),
    );
  }
}
