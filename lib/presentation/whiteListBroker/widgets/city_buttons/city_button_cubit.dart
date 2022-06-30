import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/presentation/whiteListBroker/widgets/city_buttons/city_button_cubit_state.dart';

class CityButtonCubit extends Cubit<CityButtonCubitState> {
  CityButtonCubit() : super(IntialState());

  changeState(int value) {
    emit(ChangeButtonState(id: value));
  }

}