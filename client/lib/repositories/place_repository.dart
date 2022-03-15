part of 'repository.dart';

class PlaceRepository {
  final String baseUrl = "http://192.168.0.106:3000/places";

  get $baseUrl => baseUrl;

  Future<Map> index() async {
    String endPointUrl = "$baseUrl";
    String status = "", message = "";

    List<Place> placeList = [];

    Map<String, dynamic> response = new Map<String, dynamic>();

    Uri url = Uri.parse(endPointUrl);
    await http.get(url).then((response) {
      try {
        Map<String, dynamic> body = jsonDecode(response.body);

        Iterable it = body['data'];

        status = body['status'];
        message = body['message'];
        placeList = it.map((json) => Place.fromJson(json)).toList();
      } catch (e) {
        message = e.toString();
      }
    });

    response['status'] = status;
    response['message'] = message;
    response['data'] = placeList;

    return response;
  }
}
