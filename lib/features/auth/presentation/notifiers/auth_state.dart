import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_appwrite_demo/core/res/app_constants.dart';
import 'package:flutter_appwrite_demo/features/auth/data/model/user.dart';

class AuthState extends ChangeNotifier {
  Client client = Client();
  Account account;
  Storage storage;
  bool _isLoggedIn;
  User _user;
  String _error;
  Locale locale;

  bool get isLoggedIn => _isLoggedIn;
  User get user => _user;
  String get error => _error;

  AuthState() {
    _init();
  }

  _init() {
    _isLoggedIn = false;
    _user = null;
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);
    account = Account(client);
    storage = Storage(client);
    locale = Locale(client);
    _checkIsLoggedIn();
  }

  _checkIsLoggedIn() async {
    try {
      _user = await _getAccount();
      _isLoggedIn = true;
      notifyListeners();
    } catch (e) {
      print(e.message);
    }
  }



  Future<User> _getAccount() async {
    try {
      Response<dynamic> res = await account.get();
      if (res.statusCode == 200) {
        return User.fromJson(res.data);
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }

  createAccount(String name, String email, String password) async {
    try {
      var result =
          await account.create(name: name, email: email, password: password);
      if (result.statusCode == 201) {
        _isLoggedIn = true;
        _user = await _getAccount();
        notifyListeners();
      }
    } catch (error) {
      print(error.message);
    }
  }

  logout() async {
    try {
      Response res = await account.deleteSession(sessionId: 'current');
      print(res.statusCode);
      _isLoggedIn = false;
      _user = null;
      notifyListeners();
    } catch (e) {
      _error = e.message;
      notifyListeners();
    }
  }

  login(String email, String password) async {
    try {
      Response result =
          await account.createSession(email: email, password: password);
      if (result.statusCode == 201) {
        _isLoggedIn = true;
        _user = await _getAccount();
        notifyListeners();
      }
    } catch (error) {
      print(error.message);
    }
  }
}
