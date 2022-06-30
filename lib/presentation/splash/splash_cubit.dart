import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/presentation/splash/splash_cubit_state.dart';
import 'package:on_ground/utils/routes.dart';
import 'package:on_ground/utils/shared_pref.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(InitialState());
  
  void getSharedPrefData(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 800), () async{
      final data = await getIt<SharedPref>().getSessiosnToken();
      if (data!=null && data.sessionToken != null) {
        Navigator.of(context).pushReplacementNamed(Routes.dashboard);
      } else {
        Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
      }
      
    },);
  }
}