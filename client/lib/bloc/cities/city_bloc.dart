import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ngekos/models/city.dart';
import 'package:flutter_ngekos/repositories/repository.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final CityRepository cityRepository;

  CityBloc(this.cityRepository) : super(CityInitial());

  @override
  Stream<CityState> mapEventToState(
    CityEvent event,
  ) async* {
    if (event is GetAllCity) {
      yield* _getAllCity();
    }
  }

  Stream<CityState> _getAllCity() async* {
    try {
      yield Loading();

      Map data = await cityRepository.index();

      if (data['status'] == 'failed') {
        yield ShowMessage(data['message']);
      } else {
        List<City> city = data['data'];

        yield CityLoaded(city);
      }
    } catch (e) {
      yield ShowMessage(e.toString());
    }
  }
}
