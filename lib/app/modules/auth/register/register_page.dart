import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const FastFormField(
            label: 'Email',
          ),
          const SizedBox(height: 10),
          const FastFormField(
            label: 'Senha',
          ),
          const SizedBox(height: 10),
          const FastFormField(
            label: 'Confirmar Senha',
          ),
          const SizedBox(height: 10),
          FastButton(
            label: 'Criar conta',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
