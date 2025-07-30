import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nosirovtask/di/injection.dart';
import 'package:nosirovtask/presentation/location/bloc/location_bloc.dart';
import 'package:nosirovtask/presentation/location/location_view.dart';

@RoutePage()
class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<LocationBloc>()..add(LocationEvent.started()),
      child: const LocationView(),
    );
  }
}
