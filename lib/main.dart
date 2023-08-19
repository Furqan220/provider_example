import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exp/provider/auth_provider.dart';
import 'package:provider_exp/provider/change_theme_provider.dart';
import 'package:provider_exp/provider/counter_provider.dart';
import 'package:provider_exp/provider/favourite_provider.dart';
import 'package:provider_exp/provider/slider_provider.dart';
import 'package:provider_exp/screens/index_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => SliderProvider()),
        ChangeNotifierProvider(create: (context) => FavouriteProvider()),
        ChangeNotifierProvider(create: (context) => ChangeThemeProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: Consumer<ChangeThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: value.themeMode,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.dark, seedColor: Colors.teal),
          ),
          home: const IndexScreen(),
        ),
      ),
    );
  }
}
