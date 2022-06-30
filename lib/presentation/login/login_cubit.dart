import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/model/verifyotp/verify_otp_arg_model.dart';
import 'package:on_ground/presentation/login/login_cubit_state.dart';
import 'package:on_ground/repository/userRepository/user_repository.dart';
import 'package:on_ground/utils/common.dart';
import 'package:on_ground/utils/nav_key.dart';
import 'package:on_ground/utils/routes.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit({required this.userRepository}):super(IntialState());
  
  final IUserRepository userRepository;

  bool onPhoneNuberChange(String text) {
    if (text.length < 10) {
      emit(IntialState());
      return false;
    }
    emit(NumberValidate());
    return true;
  }

  callLoginApi(BuildContext context,String number) async{
    showLoader();
    final loginData = await userRepository.sendOtp(number: number);
    hideLoader();
    if (loginData!=null) {
      Navigator.of(NavKey.navKey.currentContext!).pushNamed(Routes.optScreen,
        arguments: VerifyOtpArgModel(
          phoneNumber: number,
          requestId: loginData.requestId
        )
      );
    } 
  }
}