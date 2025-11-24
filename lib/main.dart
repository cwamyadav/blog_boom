import 'package:blogging/core/theme/theme.dart';
import 'package:blogging/dependencies/init_dependencies.dart';
import 'package:blogging/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blogging/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependecies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => serviceLocator<AuthBloc>()
    ),
  ], child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: LoginPage(),
    );
  }
}
