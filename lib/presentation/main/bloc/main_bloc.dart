
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'main_event.dart';
part 'main_state.dart';
part 'main_bloc.freezed.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.initial()) {
    on<MainEvent>((event, emit) async {
      await event.map(
        started: (e) => _onStarted(e, emit),
        onPagesSelected: (e) => _onSelectTabs(e, emit),
      );
    });
  }
  Future<void> _onStarted(_Started event, Emitter<MainState> emit) async {}

  
  _onSelectTabs(_PageSelected event, Emitter<MainState> emit) {
    emit(state.copyWith(currentPage: event.index));
  }
}
