import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../models/model_provider.dart';

class Login_secvices {
  final _formKey = GlobalKey<FormState>();


  Future<void> loginUser(BuildContext context) async {
    final url = Uri.parse(
        'http://185.132.55.54:8000/login/'); // Replace with your login API URL

    try {
      final response = await http.post(
        url,
        body: {
          'email': Provider
              .of<ModelProvider>(context, listen: false)
              .emailLoginController
              .text,
          'password': Provider
              .of<ModelProvider>(context, listen: false)
              .passwordLoginController
              .text,
        },
      );

      if (response.statusCode == 200) {
        // Login successful
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful')),
        );
        // Reset the form fields
        _formKey.currentState?.reset();
      } else {
        // Login failed
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
}