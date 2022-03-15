part of 'place_bloc.dart';

abstract class PlaceState extends Equatable {
  const PlaceState();

  @override
  List<Object> get props => [];
}

class PlaceInitial extends PlaceState {}

class Loading implements PlaceState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class PlaceLoaded implements PlaceState {
  final List<Place> place;

  PlaceLoaded(this.place);

  @override
  List<Object> get props => [place];

  @override
  bool? get stringify => false;
}

class ShowMessage implements PlaceState {
  final String message;

  ShowMessage(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => false;
}
