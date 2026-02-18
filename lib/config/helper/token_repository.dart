// import 'package:injectable/injectable.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// abstract class TokenRepository {
//
//   Future<void> saveToken(String token);
//
//   Future<void> deleteToken();
//
//   Future<String?> getToken();
//
//   Future<bool> hastToken();
// }
//
// @Injectable(as: TokenRepository)
// class TokenRepositoryImp implements TokenRepository {
//   final FlutterSecureStorage secureStorage;
//
//   final String tokenKey = 'token';
//
//   TokenRepositoryImp({required this.secureStorage});
//
//   @override
//   Future<void> deleteToken() async {
//     await secureStorage.delete(key: tokenKey);
//   }
//
//
//   @override
//   Future<void> saveToken(String token) async {
//     await secureStorage.write(key: tokenKey, value: token);
//   }
//
//   @override
//   Future<String?> getToken() async {
//     return await secureStorage.read(key: tokenKey);
//   }
//
//   @override
//   Future<bool> hastToken() async {
//     final token = await getToken();
//     return token != null && token.isNotEmpty;
//   }
// }

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TokenRepository {
  Future<void> saveToken(String token);

  Future<void> deleteToken();

  Future<String?> getToken();

  Future<bool> hastToken();
}

@Injectable(as: TokenRepository)
class TokenRepositoryImp implements TokenRepository {
  final SharedPreferences secureStorage;

  final String tokenKey = 'token';

  TokenRepositoryImp({required this.secureStorage});

  @override
  Future<void> deleteToken() async {
    await secureStorage.remove(tokenKey);
  }

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.setString(tokenKey, token);
  }

  @override
  Future<String?> getToken() async {
    if (secureStorage.containsKey(tokenKey)) {
      return secureStorage.getString(tokenKey);
    }
    return null;
    //return await secureStorage.read(key: tokenKey);
  }

  @override
  Future<bool> hastToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
