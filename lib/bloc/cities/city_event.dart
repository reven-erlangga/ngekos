part of 'city_bloc.dart';

abstract class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object> get props => [];
}

// ANCHOR get all place
class GetAllCity implements CityEvent {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}
