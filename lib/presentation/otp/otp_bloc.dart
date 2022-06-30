
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/model/verifyotp/otp_verify_req_body.dart';
import 'package:on_ground/presentation/otp/otp_bloc_state.dart';
import 'package:on_ground/repository/userRepository/user_repository.dart';
import 'package:on_ground/utils/common.dart';
import 'package:on_ground/utils/nav_key.dart';
import 'package:on_ground/utils/routes.dart';
import 'package:on_ground/utils/shared_pref.dart';

class OtpBloc extends Cubit<OtpBlocState> {
  OtpBloc({
    required this.userRepository
  }) : super(InitialState());
  final IUserRepository userRepository;
 
  String _otpText = '';
  String get otpText => _otpText;
  

  set otpText(String text) {
    _otpText = text;
  }

  verifyOtp(BuildContext context,String otp,{String? phoneNumber,String? requestId}) async{
    showLoader();
    final otpData = await userRepository.verifyOtp(
      body: OtpVerifyReqBody(
        otp: otp,
        phoneNumber: phoneNumber,
        requestId: requestId
      )
    );
    hideLoader();
    if(otpData!= null) {
      getIt<SharedPref>().saveSessionToken(otpData);
      Navigator.of(NavKey.navKey.currentContext!).pushNamedAndRemoveUntil(Routes.dashboard,ModalRoute.withName(Routes.loginScreen));
    }
  }
}