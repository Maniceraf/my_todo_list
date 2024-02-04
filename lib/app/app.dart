import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_list/config/routes/routes_provider.dart';
import 'package:my_todo_list/config/theme/app_theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ref.watch(routesProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My Todo List',
      theme: AppTheme.light,
      routerConfig: route,
    );
  }
}
