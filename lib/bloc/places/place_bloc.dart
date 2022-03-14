import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ngekos/models/place.dart';
import 'package:flutter_ngekos/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlaceRepository placeRepository;

  PlaceBloc(this.placeRepository) : super(PlaceInitial());

  @override
  Stream<PlaceState> mapEventToState(
    PlaceEvent event,
  ) async* {
    if (event is GetAllPlace) {
      yield* _getAllPlace();
    }
  }

  Stream<PlaceState> _getAllPlace() async* {
    try {
      yield Loading();

      Map data = await placeRepository.index();

      if (data['status'] == 'failed') {
        yield ShowMessage(data['message']);
      } else {
        List<Place> place = data['data'];

        yield PlaceLoaded(place);
      }
    } catch (e) {
      yield ShowMessage(e.toString());
    }
  }
}
