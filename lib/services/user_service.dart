//login
import 'dart:convert';

import 'package:sofiacare/constant.dart';
import 'package:sofiacare/model/api_response.dart';
import 'package:sofiacare/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<ApiResponse> login(String email, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(loginURL),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.formJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

//Register

Future<ApiResponse> register(String email, String password, String text) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(loginURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'email': email,
      'password': password,
      'password_confirmtion': password
    });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.formJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

//user details
//login

Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();

    final response = await http.get(Uri.parse(userURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.formJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;

      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

//Get Token
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

//get user id
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

//logout
//get user id
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}
