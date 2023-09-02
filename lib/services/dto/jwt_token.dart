import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';

class JwtTokenDto {
  final String access_token;

  JwtTokenDto(this.access_token);

  factory JwtTokenDto.fromJson(String requestBody) {
    Map<String, dynamic> jsonObject = json.decode(requestBody);

    return JwtTokenDto(jsonObject["access_token"] as String ?? "");
  }

  String getPayload() {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(access_token);

    var email = decodedToken["email"];

    return email;
  }
}
