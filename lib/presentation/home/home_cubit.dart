import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/model/addNote/add_note_req.dart';
import 'package:on_ground/model/dashborad/organisation_data.dart';
import 'package:on_ground/model/markAsLost/mark_as_lost_req.dart';
import 'package:on_ground/presentation/home/home_cubit_state.dart';
import 'package:on_ground/repository/dashborad_repository.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit({required this.dashboradRepository}) : super(InitialState());
  final IDashboradRepository dashboradRepository;
  int radioValue = -1;
  String? markReson;
  String? noteData;
  int inactiveBroker = 0;
  getDashboardData() async {
    final _data = await dashboradRepository.getDashboardData();
    if (_data!= null) {
    for (int i=0;i< (_data.length) ;i++) {
      if((_data[i].brokersData?[0].lastActiveAtInDays ?? 0) > 4) {
        inactiveBroker += 1;
      }
    }
    emit(OrgListData(organisationList: _data));
    }
    
  }

  addBrokerNote(OrganisationData? orgData) async{
    if (orgData?.brokersData?[0].brokerId != null){
      final data = await dashboradRepository.addBrokerNote(AddNotesReqBody(
        brokerId: orgData?.brokersData?[0].brokerId.toString(),
        data: noteData,
        type: radioValue.toString()
      ));
    }
  }

  markLostBroker(OrganisationData? orgData) async {
    if (orgData?.brokersData?[0].brokerId != null){
      final data = await dashboradRepository.markLostBroker(MarkAsLostReq(
      brokerId: orgData?.brokersData?[0].brokerId.toString(),
      reason: markReson
    ));
    }
    
  }
}