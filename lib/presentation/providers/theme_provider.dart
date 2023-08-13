import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Use Provider for Inmutable state
final colorListProvider = Provider((ref) => colorList);

// Use StateProvider for simple states
final isDarkModeProvider = StateProvider<bool>((ref) => false);

final selectedColorProvider =
    StateProvider<int>((ref) => ThemeColors.blue.index);

//
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  // ThemeNotifier(super.state);
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColor(int selectedColod) {
    state = state.copyWith(selectedColor: selectedColod);
  }
}
