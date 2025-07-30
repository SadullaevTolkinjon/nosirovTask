import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nosirovtask/di/injection.dart';
import 'package:nosirovtask/presentation/initial/bloc/initial_bloc.dart';
import 'package:nosirovtask/presentation/initial/initial_view.dart';

@RoutePage()
class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => locator<InitialBloc>(),
        child: const InitialView(),
      ),
    );
  }
}
