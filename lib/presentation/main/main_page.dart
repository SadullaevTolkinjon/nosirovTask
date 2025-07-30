import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nosirovtask/di/injection.dart';
import 'package:nosirovtask/presentation/main/bloc/main_bloc.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<MainBloc>()..add(MainEvent.started()),
      child: BlocListener<MainBloc, MainState>(
        listener: (context, state) {},
        child: Scaffold(
          body: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
            return Column(
              children: [],
            );
          }),
          // bottomNavigationBar: CustomNavigationBar(),
        ),
      ),
    );
  }
}
