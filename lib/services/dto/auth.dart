import 'package:telus_character_quiz/services/dto/json_object.dart';

class AuthDto extends JsonObject {
  final String email;
  final String password;
  AuthDto({required this.email, required this.password}) : super();

  @override
  Map<String, dynamic> toJson() {
    return <String, String>{"email": email, "password": password};
  }
}
