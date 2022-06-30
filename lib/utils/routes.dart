import 'package:flutter/material.dart';
import 'package:on_ground/model/verifyotp/verify_otp_arg_model.dart';
import 'package:on_ground/presentation/dashboard/dashboard_screen.dart';
import 'package:on_ground/presentation/details/details_screen.dart';
import 'package:on_ground/presentation/login/login_screen.dart';
import 'package:on_ground/presentation/otp/otp_screen.dart';
import 'package:on_ground/presentation/search/search_screen.dart';
import 'package:on_ground/presentation/splash/splash_screen.dart';

class Routes {

  static const String splashScreen = '/';
  static const String loginScreen = 'login';
  static const String optScreen = 'OtpScreen';
  static const String dashboard = 'Dashboard';
  static const String searchScreen = 'SearchScreen';
  static const String detailsScreen = 'DetailsScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
       case dashboard:
        return MaterialPageRoute(
          builder: (context) => Dashboard(),
        );
      case optScreen:
       final args = settings.arguments;
       return MaterialPageRoute(
          builder: (context) =>  OtpScreen(
            phoneNumber: (args as VerifyOtpArgModel?)?.phoneNumber,
            requestId: args?.requestId,
          ),
        );
      case searchScreen:
        return MaterialPageRoute(
            builder: ((context) => SearchScreen()
          )
        );
      case detailsScreen : 
        String args = settings.arguments as String;
        return MaterialPageRoute(builder: ((context) => DetailsScreen(
          brokerId: args,
        )));
      default:
        return MaterialPageRoute(
          builder: (contex) {
            return const Scaffold(
              body: Center(
                child: Text("404 routes not found"),
              ),
            );
          }
        );
    }

  }

}