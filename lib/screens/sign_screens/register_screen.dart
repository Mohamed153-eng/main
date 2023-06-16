import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:graduation/components/text/text_button.dart';
import 'package:graduation/components/text/text_form_field.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/models/model_provider.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const String registerScreenRoute = 'register screen';
  final _formKey = GlobalKey<FormState>();

  Future<void> registerUser(BuildContext context) async {
    final url = Uri.parse('http://185.132.55.54:8000/register/');

    try {
      final response = await http.post(
        url,
        body: {
          'first_name': Provider.of<ModelProvider>(context, listen: false)
              .firstNameRegisterController
              .text,
          'last_name': Provider.of<ModelProvider>(context, listen: false)
              .lastNameRegisterController
              .text,
          'email': Provider.of<ModelProvider>(context, listen: false)
              .emailRegisterController
              .text,
          'phone_number': Provider.of<ModelProvider>(context, listen: false)
              .phoneNumberRegisterController
              .text,
          'address': Provider.of<ModelProvider>(context, listen: false)
              .addressRegisterController
              .text,
          'password': Provider.of<ModelProvider>(context, listen: false)
              .passwordRegisterController
              .text,
        },
      );

      if (response.statusCode == 201) {
        print('Registration successful');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful')),
        );
        _formKey.currentState?.reset();
      } else {
        print('Registration failed');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed')),
        );
      }
    } catch (e) {
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
                    key: _formKey, // Assign the form key
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Create Your Account',
                                style: TextStyle(
                                  fontSize:
                                  MediaQuery.of(context).size.width / 12.5,
                                  color: defBlue,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ReusableTextFormField(
                          controller: classInstance.firstNameRegisterController,
                          text: 'First name',
                          prefix: Icon(Icons.person),
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 6.0),
                        ReusableTextFormField(
                          controller: classInstance.lastNameRegisterController,
                          text: 'Last name',
                          prefix: Icon(Icons.person_pin_rounded),
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 6.0),
                        ReusableTextFormField(
                          controller: classInstance.emailRegisterController,
                          text: 'Email',
                          prefix: Icon(Icons.email),
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 6.0),
                        ReusableTextFormField(
                          controller: classInstance.phoneNumberRegisterController,
                          text: 'Phone Number',
                          prefix: Icon(Icons.phone_android_rounded),
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Phone Number';
                            }
                            if (value.length == 12) {
                              return 'Phone Number 12 Number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 6.0),
                        ReusableTextFormField(
                          controller: classInstance.addressRegisterController,
                          text: 'Address',
                          prefix: Icon(Icons.maps_home_work_outlined),
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Address';
                            }
                            if (value.length == 12) {
                              return 'Address  12 Address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 6.0),
                        ReusableTextFormField(
                          controller: classInstance.passwordRegisterController,
                          text: 'Password',
                          prefix: Icon(Icons.lock),
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.0),
                        ReusableTextButton(
                          color: defBlue,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await registerUser(context);
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                LoginScreen.loginScreenRoute,
                                    (Route<dynamic> route) => false,
                              );
                            }
                          },
                          text: 'REGISTER',
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
