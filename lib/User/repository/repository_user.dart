//@dart=2.9

import 'dart:async';

import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/User/repository/user_fetch.dart';

class RepositoryUser {
  final _fetchUser = UserFetch();

  StreamController<List<UserModel>> _fetchUserController = StreamController();

  void fetchUser() async =>
      this._fetchUserController.add(await this._fetchUser.fetchUser());

  Stream<List<UserModel>> get getUserModel => this._fetchUserController.stream;

  void dispose() {
    _fetchUserController.close();
  }
}
