import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/presentation/splash/splash_cubit.dart';
import 'package:on_ground/presentation/splash/splash_cubit_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => getIt<SplashCubit>(),
      child: Scaffold(
        body: BlocBuilder<SplashCubit,SplashState>(
          builder: (context, state) {
            context.watch<SplashCubit>().getSharedPrefData(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Lottie.asset(
                  'assets/lottie/lf30_editor_u3eg2usa.json',
                  height: 100
                ),
                const Center(
                  child: Text(
                    'Broker Manager',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
  
}