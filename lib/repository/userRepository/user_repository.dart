import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:on_ground/model/send_otp_data.dart';
import 'package:on_ground/model/verifyotp/otp_verify_req_body.dart';
import 'package:on_ground/model/verifyotp/verify_otp_data.dart';
import 'package:on_ground/network/network_helper.dart';
import 'package:on_ground/utils/common.dart';

abstract class IUserRepository {
  Future<SendOtpData?> sendOtp({required String number});
  Future<VerifyOtpData?> verifyOtp({required OtpVerifyReqBody body});
}

class UserRepository extends IUserRepository {
  UserRepository({required this.restClient});
  final RestClient restClient;
  @override
  Future<SendOtpData?> sendOtp({required String number}) async {
   
      final response = await checkDioError(restClient.sendOtp(
      {'phone_number':number}
      )
    );
    if (response?.data != null) {
      return   SendOtpData.fromJson(response!.data);
    }
    
   return null;
    
  }

  @override
  Future<VerifyOtpData?> verifyOtp({required OtpVerifyReqBody body}) async{
   
      print(body.toJson());
      final response = await checkDioError(restClient.verifyOtp(
      body.toJson()
    ));
    if (response?.data !=null) {
      return   VerifyOtpData.fromJson(response!.data);
    }
    return null;
   } 
    
}