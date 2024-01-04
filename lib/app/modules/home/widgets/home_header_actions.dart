import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:flutter/material.dart';

class HomeHeaderActions extends StatelessWidget {
  const HomeHeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: context.theme.scaffoldBackgroundColor,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownMenu(
                width: context.width,
                expandedInsets: const EdgeInsets.all(8),
                inputDecorationTheme: const InputDecorationTheme(
                  border: InputBorder.none,
                ),
                hintText: 'Filtrar',
                dropdownMenuEntries: const [],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: FastButton(
              label: 'Novo projeto',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
