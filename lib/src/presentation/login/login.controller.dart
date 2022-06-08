import 'package:flutter_architektur_workshop/src/domain/user/user.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<UserEntity?> {
  LoginController() : super(null);

  Future<void> login(String email, String password) async {
    // This mocks some sort of request / response
    state = const UserEntity(
      name: "My Name",
      email: "My Email",
    );
  }

  Future<void> logout() async {
    // In this example user==null iff we're logged out
    state = null; // No request is mocked here but I guess we could
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, UserEntity?>((ref) {
  return LoginController();
});
