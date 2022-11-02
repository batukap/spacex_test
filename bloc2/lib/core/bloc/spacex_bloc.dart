import 'package:bloc/bloc.dart';
import 'package:bloc2/core/model/spacex_model.dart';
import 'package:bloc2/core/repository/repo_service.dart';
import 'package:equatable/equatable.dart';

part 'spacex_event.dart';
part 'spacex_state.dart';

class SpaceXBloc extends Bloc<SpaceXEvent, SpaceXState> {
  SpaceXBloc() : super(const SpaceXState()) {
    on<SpaceFetched>(_onSpaceFetced);
  }

  Future<void> _onSpaceFetced(
      SpaceFetched event, Emitter<SpaceXState> emit) async {
    try {
      if (state.status == PostStatus.initial ) {
        final ships = await fetchSpace();
        return emit(state.copyWith(status: PostStatus.success, ships: ships));
      }
      ship.clear();
      final ships = await fetchSpace();

      emit(
        state.copyWith(
          status: PostStatus.success,
          ships: List.of(state.ships)..addAll(ships),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}
