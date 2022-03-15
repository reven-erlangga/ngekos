import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ngekos/bloc/cities/city_bloc.dart';
import 'package:flutter_ngekos/bloc/places/place_bloc.dart';
import 'package:flutter_ngekos/models/tips.dart';
import 'package:flutter_ngekos/repositories/repository.dart';
import 'package:flutter_ngekos/theme.dart';
import 'package:flutter_ngekos/widgets/bottom_navbar.dart';
import 'package:flutter_ngekos/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PlaceBloc _placeBloc = PlaceBloc(PlaceRepository());
  CityBloc _cityBloc = CityBloc(CityRepository());

  @override
  void initState() {
    _placeBloc.add(GetAllPlace());

    _cityBloc.add(GetAllCity());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => _placeBloc),
              BlocProvider(create: (_) => _cityBloc)
            ],
            child: ListView(
              children: [
                // SECTION title homepage
                SizedBox(
                  height: edge,
                ),
                Padding(
                  padding: EdgeInsets.only(left: edge),
                  child: Text(
                    'Explore Now',
                    style: blackTextStyle.copyWith(fontSize: 24.0),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(left: edge),
                  child: Text(
                    'Mencari kosan yang mantul',
                    style: grayTextStyle.copyWith(fontSize: 16.0),
                  ),
                ),
                // !SECTION

                // SECTION populer city
                SizedBox(
                  height: 30,
                ),
                BlocBuilder<CityBloc, CityState>(builder: (_, state) {
                  if (state is CityLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Popular Cities',
                            style: regularTextStyle.copyWith(fontSize: 16.0),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 170,
                          child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: state.city.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: edge, vertical: edge / 2),
                                    child: CityCard(city: state.city[index]));
                              }),
                        )
                      ],
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
                // !SECTION

                // SECTION recomendation
                SizedBox(
                  height: 30,
                ),
                BlocBuilder<PlaceBloc, PlaceState>(builder: (_, state) {
                  if (state is PlaceLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Recomendation',
                            style: regularTextStyle.copyWith(fontSize: 16.0),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: state.place.length,
                            itemBuilder: (_, index) {
                              return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: edge, vertical: edge / 2),
                                  child: PlaceCard(place: state.place[index]));
                            })
                      ],
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
                // !SECTION

                SizedBox(
                  height: 30,
                ),
                // NOTE tips and trick
                Padding(
                  padding: EdgeInsets.only(left: edge),
                  child: Text(
                    'Tips and trick',
                    style: regularTextStyle.copyWith(fontSize: 16.0),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: edge, vertical: edge / 2),
                    child: GestureDetector(
                      onTap: () {},
                      child: TipsCard(
                        tips: Tips(
                            0, 'City Guidlines', "assets/tips1.png", "20 Apr"),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: edge, vertical: edge / 2),
                    child: GestureDetector(
                      onTap: () {},
                      child: TipsCard(
                        tips: Tips(1, 'Jakarta Fairship', "assets/tips2.png",
                            "11 Dec"),
                      ),
                    )),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          )),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavBar(
                imageUrl: 'assets/icon_home.png',
                isActive: true,
              ),
              BottomNavBar(
                imageUrl: 'assets/icon_email.png',
              ),
              BottomNavBar(
                imageUrl: 'assets/icon_card.png',
              ),
              BottomNavBar(
                imageUrl: 'assets/icon_love.png',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
