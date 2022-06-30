import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/utils/shared_pref.dart';

import '../network/network_helper.dart';

abstract class ICityRepository {
   Future<dynamic> getCities();
}

class CityRepository extends ICityRepository {
  CityRepository({required this.restClient});
  final RestClient restClient;
  @override
  Future getCities() async {
    try {
      final data = await restClient.getCities(getIt<SharedPref>().verifyOtpData?.sessionToken ??'');
      print(data);
    } catch(e) {
      print(e);
    }
      
  }

}