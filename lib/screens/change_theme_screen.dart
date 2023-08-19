import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exp/provider/change_theme_provider.dart';

class ChangeThemeScreen extends StatefulWidget {
  const ChangeThemeScreen({super.key});

  @override
  State<ChangeThemeScreen> createState() => _ChangeThemeScreenState();
}

class _ChangeThemeScreenState extends State<ChangeThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ChangeThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Provider"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text("Light Theme"),
            value: ThemeMode.light,
            groupValue: themeProvider.themeMode,
            onChanged: (value) => themeProvider.setTheme(value!),
          ),
          RadioListTile<ThemeMode>(
            title: const Text("Dark Theme"),
            value: ThemeMode.dark,
            groupValue: themeProvider.themeMode,
            onChanged: (value) => themeProvider.setTheme(value!),
          ),
          RadioListTile<ThemeMode>(
            title: const Text("System Default Theme"),
            value: ThemeMode.system,
            groupValue: themeProvider.themeMode,
            onChanged: (value) => themeProvider.setTheme(value!),
          ),
        ],
      ),
    );
  }
}
