import 'package:flutter/material.dart';
import 'package:flutter_ngekos/models/feature.dart';
import 'package:flutter_ngekos/models/place.dart';
import 'package:flutter_ngekos/pages/error_page.dart';
import 'package:flutter_ngekos/theme.dart';
import 'package:flutter_ngekos/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Place place;

  const DetailPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ErrorPage()));
      }
    }

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Image.network(
            place.imageUrl ?? '',
            width: size.width,
            height: size.height / 2.2,
            fit: BoxFit.fill,
          ),
          // SECTION listview content
          ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height / 2.5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place.name ?? '',
                                style: blackTextStyle.copyWith(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text.rich(TextSpan(
                                  text: '\$${place.price}',
                                  style: purpleTextStyle.copyWith(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                        text: '/ month',
                                        style: grayTextStyle.copyWith(
                                            fontSize: 16.0))
                                  ])),
                            ],
                          ),
                          Container(
                            width: size.width / 4,
                            height: 50,
                            child: ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  return Image.asset(
                                    'assets/icon_star.png',
                                    width: 20,
                                    color: (index + 1) <= (place.rating ?? 5)
                                        ? null
                                        : Color(0xff989BA1),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Text(
                        'Description',
                        style: regularTextStyle.copyWith(fontSize: 16.0),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Text(
                        place.description ?? '-',
                        style: regularTextStyle.copyWith(
                            fontSize: 14.0, wordSpacing: 4.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // NOTE main facilities
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Text(
                        'Main Facilities',
                        style: regularTextStyle.copyWith(fontSize: 16.0),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: edge / 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PhotoCard(
                            title: place.feature?.bedroom ?? '0',
                            description: 'Kitchen',
                            imageUrl: 'assets/icon_kitchen.png',
                            feature: place.feature ?? Feature(),
                          ),
                          PhotoCard(
                            title: place.feature?.bedroom ?? '0',
                            description: 'Bedroom',
                            imageUrl: 'assets/icon_bedroom.png',
                            feature: place.feature ?? Feature(),
                          ),
                          PhotoCard(
                            title: place.feature?.bedroom ?? '0',
                            description: 'Cupboard',
                            imageUrl: 'assets/icon_cupboard.png',
                            feature: place.feature ?? Feature(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Text(
                        'Contact',
                        style: regularTextStyle.copyWith(fontSize: 16.0),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: edge / 2),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ContactCard(
                                  title: place.phone ?? '-',
                                  imageUrl: "assets/icon_phone.png"),
                            ])),

                    // NOTE photo
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Text(
                        'Photos',
                        style: regularTextStyle.copyWith(fontSize: 16.0),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 80,
                        child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: edge / 1.2),
                                child: Image.asset(
                                  'assets/photo${index + 1}.png',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.fill,
                                ),
                              );
                            })),
                    // SECTION location
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Text(
                        'Location',
                        style: regularTextStyle.copyWith(fontSize: 16.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: edge),
                              child: Text(
                                place.address ?? '',
                                style: grayTextStyle,
                              ),
                            ),
                          ),
                          if (place.mapUrl != "")
                            InkWell(
                              onTap: () => _launchUrl(place.mapUrl ?? ''),
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                              ),
                            )
                        ],
                      ),
                    ),
                    // !SECTION
                    // SECTION button book now
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: edge),
                      height: 50,
                      width: size.width - (2 * edge),
                      child: TextButton(
                        onPressed: () => _launchUrl("tel://+6289614818047"),
                        child: Text('Book Now'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(purpleColor),
                            foregroundColor:
                                MaterialStateProperty.all(whiteColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // !SECTION
                  ],
                ),
              ),
            ],
          ),
          // !SECTION
          // SECTION back button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: edge, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/btn_back.png',
                      scale: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // !SECTION
        ],
      )),
    );
  }
}
