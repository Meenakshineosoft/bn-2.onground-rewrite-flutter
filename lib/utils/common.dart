import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:on_ground/utils/nav_key.dart';
import 'package:on_ground/utils/uicolors.dart';
import 'package:url_launcher/url_launcher.dart';

class Common {
  static showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: UiColors.primaryColor,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static openwhatsapp(String whatsapp,BuildContext context) async{
    
    var whatsappURlAndroid = "whatsapp://send?phone=+91$whatsapp";
    var whatappURLIos ="https://wa.me/+91$whatsapp";
    if(Platform.isIOS){
      // for iOS phone only
      await launch(whatappURLIos, forceSafariVC: false);
      // if( await canLaunch(whatappURLIos)){
         
      // }else{
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text("whatsapp no installed")));
      // }
    }else{
      // android , web
      await launch(whatsappURlAndroid);
      // if( await canLaunch(whatsappURlAndroid)){
        
      // }else{
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text("whatsapp no installed")));
      // }
    }
  }
}

showLoader() {
  if (NavKey.navKey.currentContext != null) {
      NavKey.navKey.currentContext!.loaderOverlay.show();
  }
  
    // if (NavKey.navKey.currentContext != null) {
    //   showDialog(
    //     barrierDismissible: false,
    //     context: NavKey.navKey.currentContext!,
    //     builder: (context) {
    //       return AlertDialog(
    //         backgroundColor: Colors.transparent,
    //         title: Lottie.asset(
    //               'assets/lottie/lf30_editor_u3eg2usa.json',
    //               height: 100
    //             ),
    //       );
    //     }
    //   );
    // }
}
hideLoader() {
  if (NavKey.navKey.currentContext != null) {
      NavKey.navKey.currentContext!.loaderOverlay.hide();
  }
  // if(NavKey.navKey.currentContext != null) {
  //   Navigator.of(NavKey.navKey.currentContext!).pop();
  // }
}