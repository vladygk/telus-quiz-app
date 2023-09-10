import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/services/dto/auth.dart';
import 'package:telus_character_quiz/services/dto/jwt_token.dart';
import 'package:telus_character_quiz/services/http_request.dart';
import 'package:telus_character_quiz/shared/bottom-modal.dart';
import 'package:telus_character_quiz/shared/theme.dart';
import 'package:telus_character_quiz/state/app_state.dart';

class LoginPageWrapper extends StatelessWidget {
  const LoginPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool _showClearButtonEmail = false;
  bool _showClearButtonPassword = false;
  String _email = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    var state = Provider.of<AppState>(context, listen: false);
    state.hasLogged = true;
    _controllerEmail.addListener(_onTextChanged);
    _controllerPassword.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _showClearButtonEmail = _controllerEmail.text.isNotEmpty;
      _showClearButtonPassword = _controllerPassword.text.isNotEmpty;
    });
  }

  void _clearTextEmail() {
    setState(() {
      _controllerEmail.clear();
      _showClearButtonEmail = false;
    });
  }

  void _clearTextPassword() {
    setState(() {
      _controllerPassword.clear();
      _showClearButtonPassword = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);

    return Center(
      child: ListView(
        children: [
          const Align(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 0),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  border: Border.all(color: green, width: 3),
                  color: darkPurple,
                  borderRadius: BorderRadius.circular(20)),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 25),
                      child: TextFormField(
                        controller: _controllerEmail,
                        decoration: InputDecoration(
                          labelText: 'Email', // Label text
                          hintText: 'Enter your email', // Hint text
                          prefixIcon: const Icon(FontAwesomeIcons
                              .envelope), // Icon before the input
                          suffixIcon: _showClearButtonEmail
                              ? IconButton(
                                  icon: const Icon(
                                      Icons.clear), // Icon after the input
                                  onPressed: _clearTextEmail,
                                )
                              : null,
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Please enter your email";
                          }

                          if (!emailRegex.hasMatch(value!)) {
                            return 'Please enter a valid email!';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _onTextChanged();
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 25),
                      child: TextFormField(
                        controller: _controllerPassword,
                        decoration: InputDecoration(
                          labelText: 'Password', // Label text
                          hintText: 'Enter your password', // Hint text
                          prefixIcon: const Icon(
                              FontAwesomeIcons.lock), // Icon before the input
                          suffixIcon: _showClearButtonPassword
                              ? IconButton(
                                  icon: const Icon(
                                      Icons.clear), // Icon after the input
                                  onPressed: _clearTextPassword,
                                )
                              : null,
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Please enter your password";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          _onTextChanged();
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(green)),
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState!.save();
                          // Here, you can process the registration logic with the collected data

                          final response = await Request('auth/signin').Post(
                              AuthDto(email: _email, password: _password));

                          if (response.statusCode != 400) {
                            state.accessToken =
                                JwtTokenDto.fromJson(response.body)
                                    .getPayload();
                          } else {
                            BottomModal.showBottomModal(
                                context: context,
                                bg: Colors.red.shade700,
                                title: 'Authentication error',
                                subtitle: 'Invalid credentials.',
                                icon: FontAwesomeIcons.x);
                          }
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();

    super.dispose();
  }
}
