import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/presentation/dashboard/dashboard_cubit_state.dart';
import 'package:on_ground/presentation/home/home_screen.dart';
import 'package:on_ground/presentation/whiteListBroker/white_list_broker_screen.dart';
import 'package:on_ground/repository/city_repository.dart';

import '../profile/profile_screen.dart';

class DashboardCubit extends Cubit<DashboardCubitState> {
  DashboardCubit() : super(InitialState());
  final ICityRepository _cityRepository = getIt<ICityRepository>();
  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const WhiteListBrokerScreen(),
    const ProfileScreen()
  ];


  onChangeIndex(int index) {
    selectedIndex = index;
    emit(TabIndexChange(index: selectedIndex));
  }

  getCities() {
    _cityRepository.getCities();
  }

}