import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/presentation/bloc/revenue_bloc.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/presentation/pages/revenue_screen.dart';
import 'package:sample_flutter_with_bloc/injection_container.dart';
import 'package:sample_flutter_with_bloc/routes.dart';

import 'injection_container.dart' as di;

void main() async {
  await di.init();

  runApp(BlocProvider(
    create: (context) => sl<RevenueBloc>(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutePaths.revenueScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
