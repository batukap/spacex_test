part of 'spacex_bloc.dart';

enum PostStatus { initial, success, failure }

class SpaceXState extends Equatable {
  final List<SpaceXModel> ships;

  final PostStatus status;

  const SpaceXState(
      {this.ships = const <SpaceXModel>[], this.status = PostStatus.initial});
  @override
  List<Object?> get props => [ships, status];

  SpaceXState copyWith({
    List<SpaceXModel>? ships,
    PostStatus? status,
  }) {
    return SpaceXState(
      ships: ships ?? this.ships,
      status: status ?? this.status,
    );
  }
}
