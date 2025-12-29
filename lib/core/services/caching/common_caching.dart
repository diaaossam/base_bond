import 'dart:convert';

import 'package:bond/core/services/caching/caching_keys.dart';
import 'package:bond/features/location/data/models/response/my_address.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/dependencies/injectable_dependencies.dart';

class CommonCaching {
  CommonCaching._();

  static final SharedPreferences _pref = sl<SharedPreferences>();

  static MyAddress? get defaultAddress =>
      _pref.containsKey(CachingKeys.defaultAddress)
      ? MyAddress.fromJson(
          json.decode(_pref.getString(CachingKeys.defaultAddress).toString()),
        )
      : null;

  static set address(MyAddress? address) {
    if (address == null) return;
    _pref.setString(CachingKeys.defaultAddress, jsonEncode(address.toJson()));
  }
}
