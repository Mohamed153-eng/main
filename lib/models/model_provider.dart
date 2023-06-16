import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:graduation/models/user_information_model.dart';
import 'data_product_model.dart';
import 'package:http/http.dart' as http;

class ModelProvider with ChangeNotifier {
  List selectedProduct = [];
  List selectedProductOrders = [];

  //List productsList = [];
  dynamic productPrice = 0;

  add(DataProductModel product) {
    selectedProduct.add(product);

    productPrice += product.productPrice.round();

    notifyListeners();
  }

  remove(DataProductModel product) {
    selectedProduct.remove(product);

    productPrice -= product.productPrice.round();

    notifyListeners();
  }

  get itemModelLength {
    return selectedProduct.length;
  }

  addOrder(DataProductModel productOrder) {
    selectedProductOrders.add(productOrder);

    notifyListeners();
  }

// moveToOrderScreen it is temporary
  void moveToOrderScreen() {
    for (var product in selectedProduct) {
      addOrder(product);
    }
    notifyListeners();
  }

  removeItemOfList() {
    selectedProduct.clear();
    productPrice = 0;
    notifyListeners();
  }

  int _randomNumber = 0;

  int get ProductOrderId => _randomNumber;

  int generateRandomNumber() {
    final random = Random();
    _randomNumber = random.nextInt(12587800);
    return _randomNumber;
    notifyListeners();
  }

  // method show data in information screen:
  UserInformationModel? _userInformationModel;

  Future<void> fetchUser() async {
    final response =
        await http.get(Uri.parse('http://185.132.55.54:8000/register/'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _userInformationModel = UserInformationModel.fromJson(data);
      notifyListeners();
    } else {
      throw Exception('Failed to load user');
    }
  }

  UserInformationModel? get user => _userInformationModel;

// Login Method:
  final String loginApi = 'http://185.132.55.54:8000/login/';
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();

  Future<void> loginPostRequest() async {
    Map<String, dynamic> data = {
      'email': emailLoginController.text,
      'password': passwordLoginController.text,
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.post(Uri.parse(loginApi),
        headers: headers, body: jsonEncode(data));
    if (response.statusCode == 200) {
      // Success
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      //print('${response.statusCode}');
    } else {
      // Error
      print('Error: ${response.reasonPhrase}');
    }
  }

// Register Method:
  final String registerApi = 'http://185.132.55.54:8000/register/';
  final TextEditingController firstNameRegisterController =
      TextEditingController();
  final TextEditingController lastNameRegisterController =
      TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController phoneNumberRegisterController =
      TextEditingController();
  final TextEditingController addressRegisterController =
      TextEditingController();
  final TextEditingController passwordRegisterController =
      TextEditingController();

  Future<void> registerPostRequest() async {
    Map<String, dynamic> data = {
      'email': emailRegisterController.text,
      'password': passwordRegisterController.text,
      'first_name': firstNameRegisterController.text,
      'last_name': lastNameRegisterController.text,
      'phone_number': phoneNumberRegisterController.text,
      'address': addressRegisterController.text,
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var response = await http.post(Uri.parse(registerApi),
        headers: headers, body: jsonEncode(data));
    print(response.headers);
    if (response.statusCode == 400) {
      // Bad Request
      var responseBody = jsonDecode(response.body);
      print('Bad Request: ${responseBody['message']}');
      print('${response.statusCode}');
    } else if (response.statusCode == 200) {
      // Success
     
      var responseBody = jsonDecode(response.body);
        print(responseBody);
    } else {
      // Other error
      print('Error: ${response.reasonPhrase}');
    }
  }
  // override to all controller:
  @override
  void dispose() {
    emailLoginController.dispose();
    passwordLoginController.dispose();
    emailRegisterController.dispose();
    passwordRegisterController.dispose();
    firstNameRegisterController.dispose();
    lastNameRegisterController.dispose();
    phoneNumberRegisterController.dispose();
    addressRegisterController.dispose();
  }
/*
var responseBody = jsonDecode(response.body);
classInstance.user = User.fromJson(responseBody); 

setState(() {
 
  userInformation: classInstance.user?.firstName ?? 'empty',
});
 */
}

/*
  Future<List<DataProductModel>> getAllProducts() async {
    List<dynamic> data =
        await ApiHelper().get(url: 'https://fakestoreapi.com/products');
    List<DataProductModel> productsList = [];
    for (var i = 0; i < data.length; i++) {
      productsList.add(DataProductModel.fromJson(data[i]));
    }
    return productsList;
  }
  */

/*

import 'package:flutter/foundation.dart';
import '../helper/api_helper.dart';
import 'data_product_model.dart';

class ModelProvider with ChangeNotifier {
  List selectedProduct = [];
  List selectedProductOrders = [];
  int productPrice = 0;

  add(DataProductModel product) {
    selectedProduct.add(product);

    //productPrice += product.productPrice.round();

    notifyListeners();
  }

  remove(DataProductModel product) {
    selectedProduct.remove(product);

    //productPrice -= product.productPrice.round();

    notifyListeners();
  }

  get itemModelLength {
    return selectedProduct.length;
  }

  addOrder(DataProductModel productOrder) {
    selectedProductOrders.add(productOrder);

    notifyListeners();
  }
// moveToOrderScreen it is temporary
  void moveToOrderScreen() {
    for (var product in selectedProduct) {
      addOrder(product);
    }
    notifyListeners();
  }

  removeItemOfList() {
    selectedProduct.clear();
    productPrice = 0;
    notifyListeners();
  }

  Future<List<DataProductModel>> getAllProducts() async {
    List<dynamic> data = await ApiHelper()
        .get(url: 'https://fakestoreapi.com/products');
    List<DataProductModel> productsList = [];
    for (var i = 0; i < data.length; i++) {
      productsList.add(DataProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}

*/
