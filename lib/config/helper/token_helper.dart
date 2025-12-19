class TokenDataService {
  static final TokenDataService _instance = TokenDataService._internal();
  String? _token;

  factory TokenDataService() {
    return _instance;
  }

  TokenDataService._internal();

  void setTokenData(String token) {
    _token = token;
  }

  void clearTokenData() {
    _token = null;
  }

  String? getTokenData() {
    return _token;
  }

  void updateTokenData(String updatedToken) {
    if (_token != null) {
      _token = updatedToken;
    }
  }
}
