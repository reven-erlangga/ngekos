part of 'place_bloc.dart';

@immutable
abstract class PlaceEvent extends Equatable {
  const PlaceEvent();

  @override
  List<Object> get props => [];
}

// ANCHOR get all place
class GetAllPlace implements PlaceEvent {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}
