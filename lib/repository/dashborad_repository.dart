
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/model/addNote/add_note_req.dart';
import 'package:on_ground/model/dashborad/brokers_data.dart';
import 'package:on_ground/model/dashborad/organisation_data.dart';
import 'package:on_ground/model/markAsLost/mark_as_lost_req.dart';
import 'package:on_ground/model/search/search_model.dart';
import 'package:on_ground/network/network_helper.dart';
import 'package:on_ground/utils/shared_pref.dart';

abstract class IDashboradRepository {
  Future<List<OrganisationData>?> getDashboardData();
  Future<bool?> addBrokerNote(AddNotesReqBody body);
  Future<bool?> markLostBroker(MarkAsLostReq body);
  Future<SearchModel?> getDashboardSearchData(String text);
  Future<BrokersData?> getBrokerDeatils(String brokerId);
}

class DashboradRepository extends IDashboradRepository {
  DashboradRepository({required this.restClient});
  final RestClient restClient;
  @override
  Future<List<OrganisationData>?> getDashboardData() async{
    final response =  await checkDioError(restClient.getDashboardData(getIt<SharedPref>().verifyOtpData?.sessionToken ??'',"asc"));

    if(response?.data != null) {
      List<dynamic> data = response!.data['data']['organisation_data'] as List<dynamic>;
      return data.map((e) => OrganisationData.fromJson(e)).toList();
    }
    return null;
  }

  @override
  Future<bool?> addBrokerNote(AddNotesReqBody body) async{
    final response = await checkDioError(restClient.addBrokerNote(getIt<SharedPref>().verifyOtpData?.sessionToken ??'', body));
    print(response?.data);
    return null;
  }

  @override
  Future<bool?> markLostBroker(MarkAsLostReq body) async{
    final response = await checkDioError(restClient.markBrokerLost(getIt<SharedPref>().verifyOtpData?.sessionToken ??'', body));
    print(response?.data);
    return null;
  }

  @override
  Future<SearchModel?> getDashboardSearchData(String text) async{
    final response = await checkDioError(restClient.getDashboardSearchData(getIt<SharedPref>().verifyOtpData?.sessionToken ??'', text));
    if (response?.data != null) {
      return SearchModel.fromJson(response!.data);
    }
    return null;
  }

  @override
  Future<BrokersData?> getBrokerDeatils(String brokerId) async {
    final response = await restClient.getbrokerDetails(getIt<SharedPref>().verifyOtpData?.sessionToken ??'', brokerId);
    if(response.data['data'] != null) {
      return BrokersData.fromJson(response.data['data']);
    }
    return null;
  }

}