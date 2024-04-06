import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_refactored/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) => ProviderScope(
        child: MaterialApp(
          theme: ThemeData.dark(useMaterial3: true),
          home: const HomeScreen(),
        ),
      );
}
