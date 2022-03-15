part of 'city_bloc.dart';

abstract class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}

class CityInitial extends CityState {}

class Loading implements CityState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

class CityLoaded implements CityState {
  final List<City> city;

  CityLoaded(this.city);

  @override
  List<Object> get props => [city];

  @override
  bool? get stringify => false;
}

class ShowMessage implements CityState {
  final String message;

  ShowMessage(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => false;
}
