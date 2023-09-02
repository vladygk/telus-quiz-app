import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:telus_character_quiz/services/dto/json_object.dart';

class Request {
  String ip = dotenv.env['IP']!;
  late String baseUrl;
  final String route;

  Request(this.route) {
    baseUrl = 'http://$ip:5050/';
  }

  dynamic Get() {}

  Future<http.Response> Post(JsonObject body) async {
    final url = '$baseUrl$route';

    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body.toJson()));

    return response;
  }
}
