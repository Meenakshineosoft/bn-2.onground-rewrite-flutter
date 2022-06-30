import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/presentation/otp/otp_bloc.dart';
import 'package:on_ground/utils/uicolors.dart';
// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/style.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key,this.phoneNumber,this.requestId}) : super(key: key);
  final String? phoneNumber;
  final String? requestId;
  //final OtpFieldController _controller = OtpFieldController();
  String? otp;

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<OtpBloc>();
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>bloc ,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        children:  [
            const SizedBox(height: 65,),
            const Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 10
              ),
              child: Text(
                'Enter your code',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Text(
                'The code will be sent in SMS to specified number',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: OtpTextField(
                numberOfFields: 6,
                fieldWidth: MediaQuery.of(context).size.width * 0.13,
                showFieldAsBox: true,
                borderColor: Colors.black,
                borderWidth: 1,
    
                disabledBorderColor:Colors.black,
                enabledBorderColor: Colors.black,
                focusedBorderColor: Colors.black,
                borderRadius: BorderRadius.circular(15),
                fillColor:Color.fromARGB(255, 171, 167, 167),
                onCodeChanged: (text) {
                  otp = text;
                   if( otp?.length == 6) {
                            bloc.verifyOtp(
                              context, otp ??'',
                              phoneNumber: phoneNumber,
                              requestId: requestId
                            );
                   }
                },
                onSubmit: (text) {
                  otp = text;
                   if( otp?.length == 6) {
                            bloc.verifyOtp(
                              context, otp ??'',
                              phoneNumber: phoneNumber,
                              requestId: requestId
                            );
                   }
                },
              ),
              // child: OTPTextField(
              //     controller: _controller,
              //     length: 6,
              //     fieldWidth: 55,
              //     width: MediaQuery.of(context).size.width,
              //     textFieldAlignment: MainAxisAlignment.spaceAround,
              //     fieldStyle: FieldStyle.box,
              //     otpFieldStyle: OtpFieldStyle(
              //       backgroundColor: UiColors.lightGgGray,
              //       borderColor: Colors.white,
              //       disabledBorderColor: Colors.white,
              //       enabledBorderColor: Colors.white,
              //       errorBorderColor: Colors.white,
              //       focusBorderColor: Colors.white
              //     ),
              //     outlineBorderRadius: 15,
              //     onChanged: (text){
              //      // bloc.otpText = text;
              //     },
                  
              //     onCompleted: (text){
              //      otp = text;
              //      if( otp?.length == 6) {
              //               bloc.verifyOtp(
              //                 context, otp ??'',
              //                 phoneNumber: phoneNumber,
              //                 requestId: requestId
              //               );
              //            }
              //     },
              //   ),
              ),
             Padding(
              padding: const  EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                children: const [
                  Icon(Icons.info_outline),
                  SizedBox(width: 2,),
                  Text(
                'If you do not recieve SMS, please contact your support.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic
                ),
                )
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.symmetric(

              ),
              child: Row(
                children: [
                  Padding(
                     padding: const EdgeInsets.symmetric(
                       vertical: 20,
                       horizontal: 20
                     ),
                     child: InkWell(
                       onTap: () {
                         Navigator.of(context).pop();
                       },
                       child: Container(
                                         height: 70,
                                         width: 70,
                                         decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: UiColors.lightGray,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 20,
                            color: UiColors.lightGray,
                            offset: Offset(1, 1),
                            spreadRadius: 5
                          )
                        ]
                                         ),
                                         child: const Icon(
                        Icons.keyboard_arrow_left,
                        color: UiColors.primaryColor,
                                         ),
                                       ),
                     ),
                  ),
                  Expanded(child: Container()),
                   
                    Padding(
                     padding: const EdgeInsets.symmetric(
                       vertical: 20,
                       horizontal: 20
                     ),
                     child: InkWell(
                       onTap: () {
                         if( otp?.length == 6) {
                            bloc.verifyOtp(
                              context, otp ??'',
                              phoneNumber: phoneNumber,
                              requestId: requestId
                            );
                         }
                       },
                       child: Container(
                                         height: 70,
                                         width: 70,
                                         decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: UiColors.primaryColor,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 20,
                            color: UiColors.lightGray,
                            offset: Offset(1, 1),
                            spreadRadius: 5
                          )
                        ]
                                         ),
                                         child: const Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                                         ),
                                       ),
                     ),
                  )
                ],
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
  
}