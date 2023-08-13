import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              //ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          activeColor: color,
          title: Text(
            '${color.value}',
            style: TextStyle(color: color),
          ),
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            //ref.read(selectedColorProvider.notifier).update((state) => index);
            ref.read(themeNotifierProvider.notifier).changeColor(index);
          },
        );
      },
    );
  }
}
