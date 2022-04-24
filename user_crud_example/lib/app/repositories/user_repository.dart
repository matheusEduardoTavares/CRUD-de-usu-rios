import 'package:user_crud_example/app/core/local_storage/local_storage.dart';
import 'package:user_crud_example/app/core/utils/user_utilities.dart';
import 'package:user_crud_example/app/models/user/user.dart';

class UserRepository {
  UserRepository({
    required LocalStorage localStorage
  }) : _localStorage = localStorage;

  final LocalStorage _localStorage;

  Future<bool> hasCreated() async {
    return _localStorage.contains(UserUtilities.userKey);
  }

  ///Insert and update
  Future<void> upsert(User user) async {
    await _localStorage.write(UserUtilities.userKey, user.toJson());
  }

  Future<User?> get() async {
    final userData = await _localStorage.read(UserUtilities.userKey);

    if (userData != null) {
      return User.fromJson(userData);
    }

    return null;
  }
}