import 'package:flutter_architektur_workshop/src/features/login/domain/user.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<AsyncValue<UserEntity>?> {
  LoginController() : super(null);

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      state =
          AsyncValue.data(await Future.delayed(const Duration(seconds: 2), () {
        //throw Error();
        return UserEntity(
          name: email,
          email: password,
        );
      }));
    } catch (error) {
      state = const AsyncError('Wrong!');
    }
  }

  Future<void> logout() async {
    state = null;
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, AsyncValue<UserEntity>?>((ref) {
  return LoginController();
});
