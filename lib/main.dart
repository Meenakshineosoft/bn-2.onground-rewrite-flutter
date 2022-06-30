import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/utils/appbloc_observer.dart';
import 'package:on_ground/utils/nav_key.dart';
import 'package:on_ground/utils/routes.dart';
import 'package:on_ground/utils/uicolors.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: UiColors.primaryColor
  ));
  
  setup();
  BlocOverrides.runZoned(
    () => runApp(const OnBoardingApp()),
    blocObserver: AppBlocObserver()
  );
}


class OnBoardingApp extends StatelessWidget {
  const OnBoardingApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GlobalLoaderOverlay(
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Graphik"
        ),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: Routes.splashScreen,
        navigatorKey: NavKey.navKey,
      ),
      useDefaultLoading: false,
      overlayWidget: Center(
        child: Lottie.asset(
                  'assets/lottie/lf30_editor_u3eg2usa.json',
                  height: 100
                ),
      ),
    );
  }
}