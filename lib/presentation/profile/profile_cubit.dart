import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/presentation/profile/profile_cubit_state.dart';

class ProfileCubit extends Cubit<ProfileCubitState> {
  ProfileCubit() : super(InitialState());

}