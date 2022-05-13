import 'dart:convert';

import 'package:bresil_burger_app_flutter/main.dart';
import 'package:bresil_burger_app_flutter/models/AuthInformation.dart';
import 'package:bresil_burger_app_flutter/models/User.dart';

class SecureStorageService {
  final _secureStorage = storage;

  String get keyUser => 'USER';
  String get keyAccess => 'ACCESS';
  String get keyRefresh => 'REFRESH';

  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  static Future<User?> getUser() async {
    var user = await SecureStorageService().read(SecureStorageService().keyUser);
    var userp = User.fromJson(json.decode(user!));
    print(userp.username);
    return userp ;
  }

  saveUser(AuthInformation authInformation) async {
    await write(keyAccess, authInformation.access);
    await write(keyRefresh, authInformation.refresh);
    await write(keyUser, json.encode(authInformation.user));
  }

  static Future<String?> getAccess() async {
    return await storage.read(key: 'ACCESS');
  }

  static Future<String?> getUserString() async {
    return await storage.read(key: 'USER');
  }

}