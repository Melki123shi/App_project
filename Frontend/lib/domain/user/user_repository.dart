import 'usermodel.dart';

abstract class UserRepository {
  Future<User?> getUserByEmail(String email);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
  Future<void> deleteUser(User user);

  getUser(String username, String password) {}
}
