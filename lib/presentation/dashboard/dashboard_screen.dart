import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/presentation/dashboard/dashboard_cubit.dart';
import 'package:on_ground/presentation/dashboard/dashboard_cubit_state.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key) {
    getIt<DashboardCubit>().getCities();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> getIt<DashboardCubit>()),
      ],
      child: BlocConsumer<DashboardCubit,DashboardCubitState>(
          listener: ((context, state) {
            
          }),
          builder: (buildContext,state) {
            return WillPopScope(
              onWillPop: ()async{

                showExitPopUp(context);
                return false;
              },
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                bottomNavigationBar: BottomNavigationBar(
                  items: const  <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home'
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add_task_sharp),
                      label: 'White list broker'
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle),
                      label: 'Profile'
                    )
                  ],
                  currentIndex: buildContext.read<DashboardCubit>().selectedIndex,
                  onTap: (index){
                    BlocProvider.of<DashboardCubit>(buildContext, listen: false).onChangeIndex(index);
                  },
                ),
                body: buildContext.read<DashboardCubit>().screens[buildContext.read<DashboardCubit>().selectedIndex],
              ),
            );
          }
        ),
    );
  }

  showExitPopUp(BuildContext context) {
    showDialog(context:context, builder:  (dialogContext) {
      return  AlertDialog(
        title: const Text('Are you sure want to exit?'),
        actions: [
          TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: const Text('Cancel')),
                TextButton(onPressed: (){
                  SystemNavigator.pop();
                }, child: const Text('Ok'))
        ],
      );
    });
  }
}