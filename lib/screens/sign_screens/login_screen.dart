import 'package:flutter/material.dart';
import 'package:graduation/components/text/text_button.dart';
import 'package:graduation/components/text/text_form_field.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/models/model_provider.dart';
import 'package:graduation/screens/home_screen.dart';
import 'package:graduation/screens/sign_screens/register_screen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String loginScreenRoute = 'login screen';
  final _formKey = GlobalKey<FormState>();

  Future<void> loginUser(BuildContext context) async {
    final url = Uri.parse(
        'http://185.132.55.54:8000/login/');

    try {
      final response = await http.post(
        url,
        body: {
          'email': Provider.of<ModelProvider>(context, listen: false)
              .emailLoginController
              .text,
          'password': Provider.of<ModelProvider>(context, listen: false)
              .passwordLoginController
              .text,
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful')),
        );

        _formKey.currentState?.reset();

        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeScreen.homeScreenRoute,
          (route) => false,
        );
      } else if (response.statusCode == 404) {
        // Email or password incorrect
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid email or password')),
        );
      } else {
        // Other error occurred
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed')),
        );
      }
    } catch (e) {
      // Error occurred
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ModelProvider>(
        builder: (context, classInstance, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello ... !',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 10,
                                  color: defBlue,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Enter Your Account To Login',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 17.5,
                                  color: defBlue,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ReusableTextFormField(
                          controller: classInstance.emailLoginController,
                          text: 'Email',
                          prefix: Icon(Icons.email),
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            return null;
                          },
                        ),
                        ReusableTextFormField(
                          controller: classInstance.passwordLoginController,
                          text: 'Password',
                          prefix: Icon(Icons.lock),
                          suffix: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove_red_eye),
                          ),
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                        ReusableTextButton(
                          color: defBlue,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await loginUser(context);
                            }
                          },
                          text: 'LOGIN',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "If you don't have an account, please ",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  RegisterScreen.registerScreenRoute,
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
