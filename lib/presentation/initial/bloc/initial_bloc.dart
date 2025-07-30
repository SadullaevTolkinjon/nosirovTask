import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'initial_event.dart';
part 'initial_state.dart';
part 'initial_bloc.freezed.dart';

@injectable
class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc() : super(InitialState.initial()) {
    on<InitialEvent>((event, emit) async {
      await event.map(
        started: (e) {},
        changeLang: (e) => _onChangeLang(e, emit),
      );
    });
  }

  Future<void> _onChangeLang(
      _ChangeLang event, Emitter<InitialState> emit) async {
    emit(state.copyWith(currentLang: event.lang));
  }
}
