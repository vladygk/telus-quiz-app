import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/services/dto/auth.dart';
import 'package:telus_character_quiz/services/dto/jwt_token.dart';
import 'package:telus_character_quiz/services/http_request.dart';
import 'package:telus_character_quiz/shared/bottom-modal.dart';
import 'package:telus_character_quiz/shared/theme.dart';
import 'package:telus_character_quiz/state/app_state.dart';

class RegisterPageWrapper extends StatelessWidget {
  const RegisterPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterPage();
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerRepeatPassword =
      TextEditingController();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool _showClearButtonEmail = false;
  bool _showClearButtonPassword = false;
  bool _showClearButtonRepeatPassword = false;
  String _email = '';
  String _password = '';
  String _repeatPassword = '';

  @override
  void initState() {
    super.initState();
    var state = Provider.of<AppState>(context, listen: false);
    state.hasLogged = true;
    _controllerEmail.addListener(_onTextChanged);
    _controllerPassword.addListener(_onTextChanged);
    _controllerRepeatPassword.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _showClearButtonEmail = _controllerEmail.text.isNotEmpty;
      _showClearButtonPassword = _controllerPassword.text.isNotEmpty;
      _showClearButtonRepeatPassword =
          _controllerRepeatPassword.text.isNotEmpty;
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

  void _clearTextRepeatPassword() {
    setState(() {
      _controllerRepeatPassword.clear();
      _showClearButtonRepeatPassword = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 0),
            child: Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                    child: TextFormField(
                      controller: _controllerEmail,
                      decoration: InputDecoration(
                        labelText: 'Email', // Label text
                        hintText: 'Enter your email', // Hint text
                        prefixIcon: const Icon(
                            FontAwesomeIcons.envelope), // Icon before the input
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
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

                        if (_repeatPassword != _password) {
                          return "Password doesn't match";
                        }

                        return null;
                      },
                      onChanged: (value) {
                        _password = value;
                        _onTextChanged();
                      },
                      onSaved: (value) {
                        _password = value!;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                    child: TextFormField(
                      controller: _controllerRepeatPassword,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password', // Label text
                        hintText: 'Confirm your password', // Hint text
                        prefixIcon: const Icon(
                            FontAwesomeIcons.repeat), // Icon before the input
                        suffixIcon: _showClearButtonRepeatPassword
                            ? IconButton(
                                icon: const Icon(
                                    Icons.clear), // Icon after the input
                                onPressed: _clearTextRepeatPassword,
                              )
                            : null,
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Please enter your password";
                        }
                        if (_repeatPassword != _password) {
                          return "Password doesn't match";
                        }

                        return null;
                      },
                      onChanged: (value) {
                        _repeatPassword = value;
                        _onTextChanged();
                      },
                      onSaved: (value) {
                        _repeatPassword = value!;
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

                        final response = await Request('auth/signup')
                            .Post(AuthDto(email: _email, password: _password));

                        if (response.statusCode != 400) {
                          state.accessToken =
                              JwtTokenDto.fromJson(response.body).getPayload();
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
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
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
