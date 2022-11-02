import 'dart:convert';
import 'package:bloc2/core/model/spacex_model.dart';
import 'package:http/http.dart' as http;

List<SpaceXModel> ship = [];
const String _baseUrl='https://api.spacexdata.com/v4/launches/latest';
Future<List<SpaceXModel>> fetchSpace() async {
  var url = Uri.parse(_baseUrl);
  var res = await http.get(url);
  var jsonBody = jsonDecode(res.body.toString());

  var temp = SpaceXModel.fromJson(jsonBody);

  if (res.statusCode == 200) {
    ship.add(temp);
    return ship;
  } else {
    throw SpaceException(error: res.body);
  }
}
