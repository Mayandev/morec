import 'dart:convert';

import 'package:movie_recommend/util/event_bus.dart';
import 'package:movie_recommend/global.dart';
import 'package:movie_recommend/model/user.dart';

const String EventUserLogin = 'EventUserLogin';
const String EventUserLogout = 'EventUserLogout';

class UserManager {
  static UserManager _instance;
  static UserManager get instance {
    if (_instance == null) {
      _instance = UserManager();
      _instance.loadUserFromLocal();
    }
    return _instance;
  }

  User user;
  static User get currentUser {
    return UserManager.instance.user;
  }

  logout() {
    this.user = null;
    preferences.remove('user');
    eventBus.emit(EventUserLogout);
  }

  login(Map<String, dynamic> userJson) {
    var user = User.fromJson(userJson);
    this.user = user;
    saveUser();

    eventBus.emit(EventUserLogin);
  }

  bool get isLogin {
    return user != null;
  }

  loadUserFromLocal() {
    String userJson = preferences.getString('user');
    if (userJson != null) {
      user = User.fromJson(json.decode(userJson));
    }
  }

  void saveUser() async {
    var data = json.encode(user);
    preferences.setString('user', data);
  }
}