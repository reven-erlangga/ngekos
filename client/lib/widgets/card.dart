part of 'widgets.dart';

// SECTION city card
class CityCard extends StatelessWidget {
  final City city;

  const CityCard({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18.0),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                // NOTE image
                Image.network(
                  city.imageUrl ?? "",
                  width: 120,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                // NOTE if city popular
                if (city.isPopuler)
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30))),
                      child: Center(
                        child: Image.asset(
                          'assets/icon_star.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // NOTE city name
            Text(
              city.name ?? "",
              style: blackTextStyle.copyWith(fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}

// SECTION place card
class PlaceCard extends StatelessWidget {
  final Place place;

  const PlaceCard({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DetailPage(
                    place: place,
                  ))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 140,
              height: 100,
              child: Stack(
                children: [
                  Image.network(
                    place.imageUrl ?? "",
                    width: 140,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (place.isFavorite)
                            Image.asset(
                              'assets/icon_star.png',
                              width: 20,
                              height: 20,
                            ),
                          Text(
                            '${place.rating}/5',
                            style: whiteTextStyle.copyWith(fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: edge,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place.name ?? "",
                style: blackTextStyle.copyWith(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text.rich(TextSpan(
                  text: '\$${place.price}',
                  style: purpleTextStyle.copyWith(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: '/ month',
                        style: grayTextStyle.copyWith(fontSize: 16.0))
                  ])),
              SizedBox(
                height: edge,
              ),
              Text(
                (place.city!.name ?? "-") + ", " + (place.country!.name ?? "-"),
                style: grayTextStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}
// !SECTION

// SECTION tips and trick
class TipsCard extends StatelessWidget {
  final Tips tips;

  const TipsCard({Key? key, required this.tips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            tips.imageUrl ?? '',
            width: 80,
          ),
          SizedBox(
            width: 15.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tips.title ?? '',
                style: blackTextStyle.copyWith(fontSize: 18.0),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                tips.updateAt ?? '',
                style: grayTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
// !SECTION

// SECTION facility card
class PhotoCard extends StatelessWidget {
  final Feature feature;
  final String title, description;
  final String imageUrl;

  const PhotoCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.feature,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        imageUrl,
        width: 24,
      ),
      title: Text.rich(
        TextSpan(
            text: title,
            style: purpleTextStyle.copyWith(
                fontSize: 14.0, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: "  " + description,
                  style: grayTextStyle.copyWith(fontSize: 14.0))
            ]),
      ),
    );
  }
}
// !SECTION

class ContactCard extends StatelessWidget {
  final String title, imageUrl;

  const ContactCard({Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        imageUrl,
        width: 24,
      ),
      title: Text(
        title,
        style: purpleTextStyle.copyWith(
            fontSize: 14.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
