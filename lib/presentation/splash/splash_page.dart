import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nosirovtask/core/utils/router/router.dart';
import 'package:nosirovtask/di/injection.dart';
import 'package:nosirovtask/presentation/splash/bloc/splash_bloc.dart';
import 'package:nosirovtask/presentation/splash/splash_view.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<SplashBloc>()..add(const SplashEvent.started()),
      child: BlocListener<SplashBloc, SplashState>(
        listenWhen: (previous, current) =>
            previous.navigateToOnboarding != current.navigateToOnboarding ||
            previous.navigateToLogin != current.navigateToLogin ||
            previous.navigateToHome != current.navigateToHome,
        listener: (context, state) {
          if (state.navigateToLogin) {
            context.router.replace(InitialRoute());
          } else if (state.navigateToHome) {}
        },
        child: SplashView(),
      ),
    );
  }
}
