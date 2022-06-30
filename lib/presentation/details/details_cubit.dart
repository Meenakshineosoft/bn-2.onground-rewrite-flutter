import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/model/dashborad/brokers_data.dart';
import 'package:on_ground/presentation/details/details_cubit_state.dart';
import 'package:on_ground/repository/dashborad_repository.dart';
import 'package:on_ground/utils/common.dart';

class DetailsCubit extends Cubit<DetailsCubitState> {
  DetailsCubit({required this.repository}) : super(IntialState());
  final IDashboradRepository repository;
  BrokersData? brokersData;
  getBrokerDatailsData(String brokerId) async{
    showLoader();
    final data  = await repository.getBrokerDeatils(brokerId);
    if(data != null) {
      brokersData = data;
      emit(DetailsData(
        data: data
      ));
    }
    hideLoader();
  }
}