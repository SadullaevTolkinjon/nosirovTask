import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/auth/auth_repo.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRepository _authRepository;

  SplashBloc(this._authRepository) : super(SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      await event.map(
        started: (e) => _onStarted(e, emit),
        navigate: (e) => _onNavigateToMain(e, emit),
      );
    });
  }

  Future<void> _onStarted(_Started event, Emitter<SplashState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    add(const SplashEvent.navigate());
  }

  Future<void> _onNavigateToMain(
      _Navigate event, Emitter<SplashState> emit) async {
    final isAuthenticated = await _authRepository.isAuthenticated();
    if (!isAuthenticated) {
      emit(state.copyWith(
        isLoading: false,
        isFirstTime: false,
        navigateToLogin: true,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        isFirstTime: false,
        isAuthenticated: true,
        navigateToHome: true,
      ));
    }
  }
}
