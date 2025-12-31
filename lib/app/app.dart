import 'package:flutter/material.dart';
import 'package:own_starbucks/app/app_router.dart';
import 'package:own_starbucks/shared/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      
    );
  }
}
