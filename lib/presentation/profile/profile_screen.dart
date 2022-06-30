import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/presentation/profile/profile_cubit.dart';
import 'package:on_ground/utils/routes.dart';
import 'package:on_ground/utils/shared_pref.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getIt<SharedPref>().verifyOtpData?.profile?.name ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                'Broker Network',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal
                ),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  showLogoutPopUp(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.red
                    )
                  ),
                  child: const  Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.red
                      ),
                    
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  showLogoutPopUp(BuildContext context) {
    showDialog(context:context, builder:  (dialogContext) {
      return  AlertDialog(
        title: const Text('Are you sure want to logout?'),
        actions: [
          TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: const Text('Cancel')),
                TextButton(onPressed: (){
                  getIt<SharedPref>().clearData();
                  Navigator.pushReplacementNamed(context, Routes.loginScreen);
                }, child: const Text('Ok'))
        ],
      );
    });
  }
  
}