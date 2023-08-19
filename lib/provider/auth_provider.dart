import 'dart:convert';
import 'dart:developer';
// import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  bool _isObsecure = true;
  bool get isObsecure => _isObsecure;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool _) {
    _isLoading = _;
    notifyListeners();
  }

  String _token = "";
  String get token => _token;

  String _loginText = "";
  String get loginText => _loginText;

  void hidePassword() {
    _isObsecure = !_isObsecure;
    notifyListeners();
  }

  void login(String email, password) async {
    try {
      setLoading(true);
      final http.Response response = await http.post(
          Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password});

      log(response.statusCode.toString());
      log(response.body.toString());

      final res = json.decode(response.body);
      if (response.statusCode == 200) {
        _token = res["token"];
        _loginText = "User logged in successfully";
        log("User logged in successfully");

        setLoading(false);
      } else {
        _loginText = res["error"];
        log(res["error"]);

        setLoading(false);
      }
    } catch (e) {
      _loginText = "Something went wrong";
      log(e.toString());

      setLoading(false);
    }
  }
}
