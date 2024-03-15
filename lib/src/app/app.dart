import 'package:faisal_starter_code_flutter/core/common/themes/theme.dart';
import 'package:faisal_starter_code_flutter/core/router/router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Faisal's Starter Code Flutter",
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.routerConfig,
    );
  }
}
