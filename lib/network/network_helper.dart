import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/model/addNote/add_note_req.dart';
import 'package:on_ground/model/broker_req_body.dart';
import 'package:on_ground/model/markAsLost/mark_as_lost_req.dart';
import 'package:on_ground/network/api_endpoints.dart';
import 'package:on_ground/utils/common.dart';
import 'package:on_ground/utils/nav_key.dart';
import 'package:on_ground/utils/routes.dart';
import 'package:on_ground/utils/shared_pref.dart';
import 'package:retrofit/retrofit.dart';
part 'network_helper.g.dart';
enum BaseUrlEnum{
  staging,
  admin
}
 extension BaseUrlEnumTOString on BaseUrlEnum{
   String getBaseUrl() {
     switch(this) {
       
       case BaseUrlEnum.staging:
         return "https://api.staging.brokernetwork.app/";
         
      case BaseUrlEnum.admin:
          return 'https://api-admin.brokernetwork.app/';
         
     }
   }
 }

 Future<HttpResponse<dynamic>?> checkDioError(Future<HttpResponse<dynamic>> apiCall) async{

   try{
     final response = await apiCall;
     return response;
   } on DioError catch(e) {
     if(e.response?.statusCode == 401) {
       getIt<SharedPref>().clearData();
       if(NavKey.navKey.currentContext != null) {
         Navigator.of(NavKey.navKey.currentContext!).pushReplacementNamed(Routes.loginScreen);
       }
       return null;
     }
     if ( e.response?.data != null) {
       
       if(e.response?.data?['message'] is List<dynamic>) {
         print('data.length ${e.response?.data.length}');
       } else {
         Common.showToast(e.response?.data?['message'] ?? '');
       }
     }
     return null;
   }

 }

 
 @RestApi(baseUrl: 'https://api.staging.brokernetwork.app/')
 abstract class RestClient {
   factory RestClient(Dio dio,{String baseUrl}) = _RestClient;

   @POST(ApiEndPoints.SEND_OTP)
   Future<HttpResponse<dynamic>> sendOtp(@Body() Map<String,dynamic> json);
   @POST(ApiEndPoints.VERIFY_OTP)
   Future<HttpResponse<dynamic>> verifyOtp(@Body() Map<String,dynamic> json);
   ///Employee drop down
   @GET(ApiEndPoints.ALL_BN_EMPLOYEES)
   Future<HttpResponse<dynamic>> getAllBnEmployee(@Header("session-token") String token);
  ///polygon drop down   
   @GET(ApiEndPoints.ALL_POLYGON_LOC)
   Future<HttpResponse<dynamic>> allPolygonLoc(
     @Header("session-token") String token,
     @Query('city_id') String query
    );

   @POST(ApiEndPoints.BROKER_WHITELIST)
   Future<HttpResponse<dynamic>> whilteListBroker(
     @Header("session-token") String token,
     @Body() WhitelistReqBody body
   );
  @GET(ApiEndPoints.ON_GROUND_DASHBOARD)
  Future<HttpResponse<dynamic>> getDashboardData(@Header("session-token") String token,@Query('q') String query);
   
  @POST(ApiEndPoints.BROKER_MARK_LOST)
  Future<HttpResponse<dynamic>> markBrokerLost(@Header("session-token") String token,@Body() MarkAsLostReq body);

  @POST(ApiEndPoints.BROKER_ADD_NOTES)
  Future<HttpResponse<dynamic>> addBrokerNote(@Header("session-token") String token,@Body() AddNotesReqBody body);

  @GET(ApiEndPoints.ON_GROUND_DASHBOARD_SEARCH)
  Future<HttpResponse<dynamic>> getDashboardSearchData(@Header("session-token") String token,@Query('q') String query);

  @GET(ApiEndPoints.BROKER_DETAILS)
  Future<HttpResponse<dynamic>> getbrokerDetails(@Header("session-token") String token,@Query('broker_id') String query);
  @POST(ApiEndPoints.getCity)
  Future<HttpResponse<dynamic>> getCities(@Header("session-token") String token);
 }
 