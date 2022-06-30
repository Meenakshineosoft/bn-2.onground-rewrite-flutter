import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/presentation/login/login_cubit.dart';
import 'package:on_ground/presentation/login/login_cubit_state.dart';
import 'package:on_ground/utils/uicolors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController? _controller = TextEditingController();
  final formState = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset:true,
        body: SafeArea(
          child: BlocBuilder<LoginCubit,LoginCubitState>(
            builder: (context, state) {
              return Form(
                key: formState,
                child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:   [
                const Padding(
                   padding: EdgeInsets.only(
                     top: 30,
                     left: 15
                   ),
                   child: Text(
                     "Enter your phone\nnumber",
                     style: TextStyle(
                       fontSize: 32,
                       fontWeight: FontWeight.bold
                     ),
                  ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(
                     horizontal: 15,
                     vertical: 15
                   ),
                   child: Container(
                     width: double.infinity,
                     height: 55,
                     decoration:  BoxDecoration(
                       color: UiColors.lightGgGray,
                       borderRadius: BorderRadius.circular(25)
                     ),
                     child: Row(
                       children:  [
                         Container(
                           width: 80,
                           height: 55,
                           decoration: BoxDecoration(
                              color: UiColors.lightGray,
                              borderRadius: BorderRadius.circular(28)
                           ),
                           child:const Center(
                             child:  Text(
                               "+91",
                               style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold
                               ),
                            ),
                           ),
                         ),
                         const SizedBox(width: 10,),
                         Expanded(
                           child: TextFormField(
                             controller: _controller,
                             decoration:const InputDecoration(
                               border: InputBorder.none
                             ),
                             style:const TextStyle(
                               fontSize: 22
                             ),
                             onChanged: (text) {
                               BlocProvider.of<LoginCubit>(context, listen: false).onPhoneNuberChange(text);
              
                             },
                             
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10,), //n is maximum number of characters you want in textfield
                            ],
                            enableSuggestions: false,
                           
                          )
                        )
                       ],
                     ),
                   ),
                 ),
                Expanded(
                  child: Container(),
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                     if (state is NumberValidate)
                      Padding(
                       padding: const EdgeInsets.symmetric(
                         vertical: 20,
                         horizontal: 20
                       ),
                       child: InkWell(
                         onTap: () {
                           getIt<LoginCubit>().callLoginApi(context,_controller?.text ?? '');
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
                )
                          ],
                        ),
              );
            },
          ),
        ),
      ),
    );
  }

  
}