import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:on_ground/model/verifyotp/profile.dart';
import 'package:on_ground/network/network_helper.dart';
import 'package:on_ground/presentation/dashboard/dashboard_cubit.dart';
import 'package:on_ground/presentation/details/details_cubit.dart';
import 'package:on_ground/presentation/home/home_cubit.dart';
import 'package:on_ground/presentation/login/login_cubit.dart';
import 'package:on_ground/presentation/otp/otp_bloc.dart';
import 'package:on_ground/presentation/search/search_cubit.dart';
import 'package:on_ground/presentation/splash/splash_cubit.dart';
import 'package:on_ground/presentation/whiteListBroker/white_list_broker_cubit.dart';
import 'package:on_ground/presentation/whiteListBroker/widgets/city_buttons/city_button_cubit.dart';
import 'package:on_ground/repository/city_repository.dart';
import 'package:on_ground/repository/dashborad_repository.dart';
import 'package:on_ground/repository/userRepository/user_repository.dart';
import 'package:on_ground/repository/whitelist_repository.dart';
import 'package:on_ground/utils/shared_pref.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<SharedPref>(SharedPref());
  Dio dio = Dio();

  ///register singleton class
  getIt.registerSingleton<Dio>(dio);
  //production build
  //getIt.registerSingleton<RestClient>(RestClient(getIt(),baseUrl: BaseUrlEnum.admin.getBaseUrl()));
  //staging build
  getIt.registerSingleton<RestClient>(
      RestClient(getIt(), baseUrl: BaseUrlEnum.staging.getBaseUrl()));

  ///register repository classes
  getIt.registerFactory<IUserRepository>(
      () => UserRepository(restClient: getIt<RestClient>()));
  getIt.registerFactory<IWhitelistRepository>(
      () => WhitelistRepository(restClient: getIt<RestClient>()));
  getIt.registerFactory<IDashboradRepository>(
      () => DashboradRepository(restClient: getIt()));
  getIt.registerFactory<ICityRepository>(
      () => CityRepository(restClient: getIt()));

  ///Reg bloc classes
  getIt.registerFactory<SplashCubit>(() => SplashCubit());
  getIt.registerFactory<LoginCubit>(() => LoginCubit(userRepository: getIt()));
  getIt.registerFactory<OtpBloc>(() => OtpBloc(userRepository: getIt()));
  getIt.registerFactory<DashboardCubit>(() => DashboardCubit());
  getIt.registerFactory<HomeCubit>(
      () => HomeCubit(dashboradRepository: getIt()));
  getIt.registerFactory<WhiteListBrokerCubit>(
      () => WhiteListBrokerCubit(repository: getIt()));
  getIt.registerFactory<Profile>(() => Profile());
  getIt.registerFactory<SearchCubit>(() => SearchCubit(repository: getIt()));

  getIt.registerFactory<DetailsCubit>(() => DetailsCubit(repository: getIt()));

  ///Widget cubit
  getIt.registerFactory<CityButtonCubit>(() => CityButtonCubit());
}
