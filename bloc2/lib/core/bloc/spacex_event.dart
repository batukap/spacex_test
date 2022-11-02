part of 'spacex_bloc.dart';

abstract class SpaceXEvent extends Equatable {
  const SpaceXEvent();
  @override
  List<Object?> get props => [];
}

class SpaceFetched extends SpaceXEvent {
  const SpaceFetched();
}
