import 'dart:convert';

import 'package:on_ground/model/verifyotp/verify_otp_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref();
  VerifyOtpData? _verifyOtpData;
  VerifyOtpData? get verifyOtpData => _verifyOtpData;
  saveSessionToken(VerifyOtpData value) async{
    _verifyOtpData = value;
    final instance = await  SharedPreferences.getInstance();
    final jsons = json.encode(value);
    instance.setString("session", jsons);
  }
  Future<VerifyOtpData?> getSessiosnToken() async {
    
    final instance = await  SharedPreferences.getInstance();
    final data = instance.getString('session');
    if (data != null) {
      final jsonData = json.decode(data);
      _verifyOtpData = VerifyOtpData.fromJson(jsonData);
      return _verifyOtpData;
    }
    return null;
  }

  Future<bool> clearData() async{
     final instance = await  SharedPreferences.getInstance();
     return instance.clear();
  }
}