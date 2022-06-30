import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/model/broker_req_body.dart';
import 'package:on_ground/model/polygon/polygon_model.dart';
import 'package:on_ground/network/network_helper.dart';
import 'package:on_ground/utils/shared_pref.dart';

import '../model/employee/employee_model.dart';

abstract class IWhitelistRepository {
  Future<List<EmployeeModel>?> getAllBNEmployee();
  Future<List<PolygoneModel>?> getAllLocation(String cityId);
  Future<bool?> whilteListBroker(WhitelistReqBody body);
}

class WhitelistRepository extends IWhitelistRepository{
  WhitelistRepository({required this.restClient});
  final RestClient restClient;
  @override
  Future<List<EmployeeModel>?> getAllBNEmployee() async{
    final response = await checkDioError(restClient.getAllBnEmployee(getIt<SharedPref>().verifyOtpData?.sessionToken ?? ''));
    if(response?.data !=null) {
      List<dynamic> data = response!.data as List<dynamic>;
      return data.map((e) => EmployeeModel.fromJson(e)).toList();
    }
    return null;
  }

  @override
  Future<List<PolygoneModel>?> getAllLocation(String cityId) async{
    final response = await checkDioError(restClient.allPolygonLoc(getIt<SharedPref>().verifyOtpData?.sessionToken ?? '',cityId));

    if(response?.data !=null) {
      List<dynamic> data = response!.data['data'] as List<dynamic>;
      return data.map((e) => PolygoneModel.fromJson(e)).toList();
    }
   
   return null;
  }

  @override
  Future<bool?> whilteListBroker(WhitelistReqBody body) async{
    final response = await  checkDioError(restClient.whilteListBroker(getIt<SharedPref>().verifyOtpData?.sessionToken ?? '', body));
    if(response?.response.statusCode == 200 || response?.response.statusCode == 201) {
      return true; 
    }
    return false;
  }
  
}